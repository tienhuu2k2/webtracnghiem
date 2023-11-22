<?php

require_once 'views/view_login.php';
require_once 'models/model_login.php';
require_once 'models/model_admin.php';
require_once 'models/model_student.php';

require_once 'views/view_signup.php';

class Controller_Login
{
    public function show_login()
    {
        $view = new View_Login();
        $view->show_login();

        // $view = new View_Signup();
        // $view->show_signup();
    }

    // signup
    public function show_signup()
    {
        $view = new View_Signup();
        $view->show_signup();
    }

    public function submit_login()
    {
        $result = array();
        if (isset($_POST['username'])) {
            $username = htmlspecialchars(addslashes($_POST['username']));
            $user = $this->get_username($username);
            if (!empty($user)) {
                $result['status_value'] = "Nhập mật khẩu để tiếp tục...";
                $result['name'] = $user->name;
                $result['status'] = 1;
                $_SESSION['username'] = $user->username;
            } else {
                $result['status_value'] = "Tài khoản hoặc email không tồn tại!";
                $result['status'] = 0;
            }
        } else {
            $result['status_value'] = "Nhập tài khoản hoặc email!";
            $result['status'] = 0;
        }
        echo json_encode($result);
    }

    // signup
    public function submit_register()
    {
        $gender_id = 0;
        $result = array();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Xử lý dữ liệu đăng ký từ form
            $username = isset($_POST['username']) ? htmlspecialchars($_POST['username']) : '';
            $password = isset($_POST['password']) ? md5($_POST['password']) : '';
            $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
            $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
            $gender = isset($_POST['gender']) ? htmlspecialchars($_POST['gender']) : '';
            $birthday = isset($_POST['birthday']) ? htmlspecialchars($_POST['birthday']) : '';
            $class_student = isset($_POST['class_student']) ? htmlspecialchars($_POST['class_student']) : '';

            // Chuyển đổi ngày về đúng định dạng
            if (!empty($birthday) && ($dateTime = DateTime::createFromFormat('d/m/Y', $birthday)) instanceof DateTime) {
                $formattedBirthday = $dateTime->format('Y-m-d');
            }

            // Chuyển đổi giới tính về đúng id

            if ($gender == 'male')
                $gender_id = 2;
            elseif ($gender == 'female')
                $gender_id = 3;
            elseif ($gender == 'other')
                $gender_id = 1;

            // chuyen doi class ve dung id
            if ($class_student == '1')
                $class_id = 1;
            elseif ($class_student == '2')
                $class_id = 1;
            elseif ($class_student == '3')
                $class_id = 1;
            elseif ($class_student == '4')
                $class_id = 1;

            // var_dump($class_id);

            // Kiểm tra xem tên đăng nhập đã tồn tại chưa
            if ($this->get_username($username)) {
                $result['status_value'] = "Tên đăng nhập đã tồn tại!";
                $result['status'] = 0;
            } else {
                // Thực hiện thêm dữ liệu vào cơ sở dữ liệu
                $modelStudent = new Model_Student(); // Điều này phải được điều chỉnh tùy thuộc vào tên thực tế của model_admin của bạn
                $registrationResult = $modelStudent->add_student($name, $username, $password, $email, $formattedBirthday, $gender_id, $class_id);

                if ($registrationResult) {
                    $result['status_value'] = "Đăng ký thành công!";
                    $result['status'] = 1;
                } else {
                    $result['status_value'] = "Đăng ký thất bại!";
                    $result['status'] = 0;
                }
            }
            
        } else {
            $result['status_value'] = "Phương thức không hợp lệ!";
            $result['status'] = 0;
        }


        // Trả về kết quả dưới dạng JSON

        echo json_encode($result);
    }



    public function submit_password()
    {
        $result = array();
        $password = isset($_POST['password']) ? md5($_POST['password']) : '';
        if (isset($_SESSION['username'])) {
            $user = $this->get_password($_SESSION['username']);
            if ($password == $user->password) {
                $result['status_value'] = "Đăng nhập thành công, chuẩn bị chuyển hưóng...";
                $result['status'] = 1;
                if ($user->permission == 1) {
                    $_SESSION['permission'] = "admin";
                }
                if ($user->permission == 2) {
                    $_SESSION['permission'] = "teacher";
                }
                if ($user->permission == 3) {
                    $_SESSION['permission'] = "student";
                }
                $_SESSION['login'] = true;
            } else {
                $result['status_value'] = "Sai mật khẩu!";
                $result['status'] = 0;
            }
        }
        echo json_encode($result);
    }
    public function get_password($username)
    {
        $model = new Model_Login();
        return $model->get_password($username);
    }
    public function get_username($username)
    {
        $model = new Model_Login();
        return $model->get_username($username);
    }

    public function submit_forgot_password()
    {
        $result = array();
        $model = new  Model_Login();
        require_once 'res/libs/class.phpmailer.php';
        require_once 'res/libs/class.smtp.php';
        $username = isset($_POST['username']) ? Htmlspecialchars($_POST['username']) : '';
        $get = $this->reset_password($username);
        if ($get) {
            $password = $get->password;
            $nameTo = $get->name;
            $mailTo = $get->email;
            $mail = $this->send_mail($password, $nameTo, $mailTo);
            if ($mail) {
                $result['status_value'] = "Gửi email thành công. Kiểm tra hộp thư để lấy mật khẩu (có thể trong Spam)";
                $result['status'] = 1;
                $model->update_new_password(md5($password), $get->permission, $username);
            } else {
                $result['status_value'] = "Gửi email thất bại, vui lòng thử lại trong giây lát.";
                $result['status'] = 0;
            }
        } else {
            $result['status_value'] = "Tài khoản hoặc email không tồn tại, vui lòng thử lại.";
            $result['status'] = 0;
        }
        echo json_encode($result);
    }
    public function reset_password($username)
    {
        $model = new Model_Login();
        return $model->reset_password($username);
    }

    public function send_mail($password, $nTo, $mTo)
    {
        $nFrom = 'IKun.Org';
        $mFrom = 'example@gmail.com';
        $mPass = 'example';
        $mail = new PHPMailer();
        $content = 'Đây là mật khẩu của bạn.<br /><b>' . $password . '</b><br />Hãy đổi ngay sau khi đăng nhập. <br />Đây là email gửi tự động, vui lòng không trả lời email này.';
        $body = $content;
        $mail->IsSMTP();
        $mail->CharSet  = "utf-8";
        $mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
        $mail->SMTPAuth   = true;                   // enable SMTP authentication
        $mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
        $mail->Host       = "smtp.gmail.com";
        $mail->Port       = 465;
        $mail->Username   = $mFrom;  // GMAIL username
        $mail->Password   = $mPass;              // GMAIL password
        $mail->SetFrom($mFrom, $nFrom);
        $title = 'Reset Mật Khẩu Trên Hệ Thống Trắc Nghiệm Online';
        $mail->Subject    = $title;
        $mail->MsgHTML($body);
        $address = $mTo;
        $mail->AddAddress($address, $nTo);
        $mail->AddReplyTo('noreply24@ikun.org', 'IKun.Org');
        if (!$mail->Send()) {
            return false;
        } else {
            return true;
        }
    }


    // public function add_user($username, $password, $name, $email, $gender, $birthday)
    // {
    //     $result = array();

    //     try {
    //         // Sử dụng PDO để thực hiện truy vấn SQL
    //         $sql = "INSERT INTO users (username, password, name, email, gender, birthday) VALUES (?, ?, ?, ?, ?, ?)";
    //         $stmt = $this->db->prepare($sql);
    //         $stmt->execute([$username, $password, $name, $email, $gender, $birthday]);

    //         // Trả về true nếu thành công
    //         $result['status_value'] = "Đăng ký thành công!";
    //         $result['status'] = 1;
    //     } catch (PDOException $e) {
    //         // Xử lý lỗi nếu có
    //         // In hoặc ghi log lỗi
    //         $result['status_value'] = "Đăng ký thất bại!";
    //         $result['status'] = 0;
    //     }

    //     // Trả về kết quả dưới dạng JSON
    //     echo json_encode($result);
    // }
}
