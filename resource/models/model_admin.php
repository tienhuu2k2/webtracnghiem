<?php

include_once('config/database.php');

class Model_Admin extends Database
{
    public function get_admin_info($username)
    {
        $sql = "
        SELECT admin_id,username,avatar,email,name,last_login,birthday,permission_detail,gender_detail,genders.gender_id FROM admins
        INNER JOIN permissions ON admins.permission = permissions.permission
        INNER JOIN genders ON admins.gender_id = genders.gender_id
        WHERE username = '$username'";
        $this->set_query($sql);
        return $this->load_row();
    }
    public function get_student_info($username)
    {
        $sql = "
        SELECT student_id,username,name,email,avatar,birthday,last_login,gender_detail FROM `students`
        INNER JOIN genders ON students.gender_id = genders.gender_id WHERE username = '$username'";
        $this->set_query($sql);
        return $this->load_row();
    }
    public function get_class_info($class_name)
    {
        $sql = "
        SELECT class_id,class_name FROM classes
        WHERE class_name = '$class_name'";
        $this->set_query($sql);
        return $this->load_row();
    }
    public function get_list_admins()
    {
        $sql = "SELECT admin_id,username,avatar,email,name,last_login,birthday,permission_detail,gender_detail FROM admins
        INNER JOIN permissions ON admins.permission = permissions.permission
        INNER JOIN genders ON admins.gender_id = genders.gender_id";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function update_last_login($admin_id)
    {
        $sql = "UPDATE admins set last_login=NOW() where admin_id='$admin_id'";
        $this->set_query($sql);
        $this->execute_return_status();
    }
    public function valid_username_or_email($data)
    {
        $sql = "SELECT name FROM students WHERE username = '$data' OR email = '$data'
        UNION
        SELECT name FROM teachers WHERE username = '$data' OR email = '$data'
        UNION
        SELECT name FROM admins WHERE username = '$data' OR email = '$data'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        } else {
            return true;
        }
    }
    public function valid_class_name($class_name)
    {
        $sql = "SELECT class_id FROM classes WHERE class_name = '$class_name'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        } else {
            return true;
        }
    }
    public function valid_email_on_profiles($curren_email, $new_email)
    {
        $sql = "SELECT name FROM students WHERE email = '$new_email' AND email NOT IN ('$curren_email')
        UNION SELECT name FROM admins WHERE email = '$new_email' AND email NOT IN ('$curren_email')
        UNION SELECT name FROM teachers WHERE email = '$new_email' AND email NOT IN ('$curren_email')";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        } else {
            return true;
        }
    }
    public function edit_admin($admin_id, $password, $name, $gender_id, $birthday)
    {
        $sql = "SELECT username FROM admins WHERE admin_id = '$admin_id'";
        $this->set_query($sql);
        if ($this->load_row() == '') {
            return false;
        }
        $sql = "UPDATE admins set password='$password', name ='$name', gender_id ='$gender_id', birthday ='$birthday' where admin_id='$admin_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        return true;
    }
    public function del_admin($admin_id)
    {
        $sql = "DELETE FROM admins where admin_id='$admin_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "SELECT username FROM admins WHERE admin_id = '$admin_id'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        }
        return true;
    }
    public function add_admin($name, $username, $password, $email, $birthday, $gender)
    {
        $sql = "SELECT admin_id FROM admins WHERE username = '$username' OR email = '$email'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        }
        //reset AUTO_INCREMENT
        $sql = "ALTER TABLE `admins` AUTO_INCREMENT=1";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "INSERT INTO admins (name, username, password, email, birthday, gender_id) VALUES ('$name', '$username', '$password', '$email', '$birthday', '$gender')";
        $this->set_query($sql);
        return $this->execute_return_status();
        // return true;
    }
    public function get_list_students()
    {
        $sql = "
        SELECT student_id,username,name,email,avatar,birthday,last_login,gender_detail FROM `students`
        INNER JOIN genders ON students.gender_id = genders.gender_id";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function edit_student($student_id, $birthday, $password, $name, $gender)
    {
        $sql = "UPDATE students set birthday='$birthday', password='$password', name ='$name', gender_id = '$gender' where student_id='$student_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        // $sql="UPDATE scores set  where student_id='$student_id'";
        // $this->set_query($sql);
        // $this->execute_return_status();
    }
    public function del_student($student_id)
    {
        $sql = "DELETE FROM scores where student_id='$student_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "DELETE FROM students where student_id='$student_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "SELECT username FROM students WHERE student_id = '$student_id'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        }
        return true;
    }
    public function add_student($username, $password, $name, $email, $birthday, $gender)
    {
        $sql = "SELECT student_id FROM students WHERE username = '$username' OR email = '$email";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        }
        //reset AUTO_INCREMENT
        $sql = "ALTER TABLE `students` AUTO_INCREMENT=1";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "INSERT INTO students (username,password,name,email,birthday,gender_id) VALUES ('$username','$password','$name','$email','$birthday','$gender')";
        $this->set_query($sql);
        return $this->execute_return_status();
        // return true;
    }
    public function get_list_classes()
    {
        $sql = "
        SELECT class_id,class_name FROM classes";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function get_list_units($class_id)
    {
        $sql = "SELECT DISTINCT unit, COUNT(unit) as total FROM questions WHERE class_id = $class_id GROUP BY unit";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function list_quest_of_unit($class_id, $unit, $limit)
    {
        $sql = "SELECT * FROM `questions` WHERE `class_id` = $class_id and `unit` = $unit ORDER BY RAND() LIMIT $limit";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function edit_class($class_id, $class_name)
    {
        $sql = "UPDATE classes set class_name='$class_name'  where class_id ='$class_id'";
        $this->set_query($sql);
        $this->execute_return_status();
    }
    public function toggle_test_status($test_code, $status_id)
    {
        $sql = "UPDATE tests set status_id='$status_id' where test_code ='$test_code'";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function del_class($class_id)
    {
        $sql = "DELETE FROM chats where class_id='$class_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "DELETE FROM student_notifications where class_id='$class_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "DELETE FROM classes where class_id='$class_id'";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "SELECT class_name FROM classes WHERE class_id = '$class_id'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        }
        return true;
    }
    public function add_class($class_name)
    {
        $sql = "SELECT class_id FROM classes WHERE class_name = '$class_name'";
        $this->set_query($sql);
        if ($this->load_row() != '') {
            return false;
        }
        //reset AUTO_INCREMENT
        $sql = "ALTER TABLE `classes` AUTO_INCREMENT=1";
        $this->set_query($sql);
        $this->execute_return_status();
        $sql = "INSERT INTO classes (class_name) VALUES ('$class_name')";
        $this->set_query($sql);
        return $this->execute_return_status();
        // return true;
    }
    public function add_quest_to_test($test_code, $question_id)
    {
        $sql = "INSERT INTO quest_of_test (test_code,question_id) VALUES ('$test_code','$question_id')";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function get_list_questions()
    {
        $sql = "
        SELECT questions.question_id,questions.question_content,questions.unit,classes.class_name, questions.answer_a,questions.answer_b,questions.answer_c,questions.answer_d,questions.correct_answer FROM `questions`
        INNER JOIN classes ON classes.class_id = questions.class_id";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function get_list_tests()
    {
        $sql = "
        SELECT tests.test_code,tests.test_name,tests.password,tests.total_questions,tests.time_to_do,tests.note,classes.class_name,statuses.status_id,statuses.detail as status FROM `tests`
        INNER JOIN classes ON classes.class_id = tests.class_id
        INNER JOIN statuses ON statuses.status_id = tests.status_id";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function get_question_info($ID)
    {
        $sql = "
        SELECT questions.ID,questions.question_detail,classes.class_name, questions.answer_a,questions.answer_b,questions.answer_c,questions.answer_d,questions.correct_answer FROM `questions`
        INNER JOIN classes ON classes.class_id = questions.class_id";
        $this->set_query($sql);
        return $this->load_row();
    }
    public function get_list_statuses()
    {
        $sql = "
        SELECT * FROM `statuses`";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function edit_question($question_id, $question_content, $class_id, $unit, $answer_a, $answer_b, $answer_c, $answer_d, $correct_answer)
    {
        $sql = "UPDATE questions set question_content='$question_content', class_id='$class_id', unit ='$unit',answer_a ='$answer_a',answer_b ='$answer_b',answer_c ='$answer_c',answer_d ='$answer_d',correct_answer ='$correct_answer' where question_id = '$question_id'";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function del_question($question_id)
    {
        $sql = "DELETE FROM questions where question_id='$question_id'";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function add_question($question_detail, $class_id, $unit, $answer_a, $answer_b, $answer_c, $answer_d, $correct_answer)
    {
        $sql = "INSERT INTO questions (class_id,unit,question_content,answer_a,answer_b,answer_c,answer_d,correct_answer) VALUES ($class_id,$unit,'$question_detail','$answer_a','$answer_b','$answer_c','$answer_d','$correct_answer')";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function add_test($test_code, $test_name, $password, $class_id, $total_questions, $time_to_do, $note)
    {
        $sql = "INSERT INTO tests (test_code,test_name,password,class_id,total_questions,time_to_do,note,status_id) VALUES ($test_code,'$test_name', '$password', $class_id, $total_questions, $time_to_do, '$note', 2)";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function insert_notification($notification_id, $username, $name, $notification_title, $notification_content)
    {
        $sql = "INSERT INTO notifications (notification_id,username,name,notification_title,notification_content,time_sent) VALUES ($notification_id,'$username','$name','$notification_title','$notification_content',NOW())";
        $this->set_query($sql);
        return $this->execute_return_status();
    }
    public function notify_class($ID, $class_id)
    {
        $sql = "INSERT INTO student_notifications (notification_id,class_id) VALUES ('$ID','$class_id')";
        $this->set_query($sql);
        $this->execute_return_status();
    }
    public function get_student_notifications()
    {
        $sql = "
        SELECT notifications.notification_id, notifications.notification_title, notifications.notification_content, notifications.username,notifications.name,classes.class_name,notifications.time_sent FROM student_notifications
        INNER JOIN notifications ON notifications.notification_id = student_notifications.notification_id
        INNER JOIN classes ON classes.class_id = student_notifications.class_id
        ORDER BY `ID` DESC";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function get_test_score($test_code)
    {
        $sql = "SELECT * FROM `scores` INNER JOIN students ON scores.student_id = students.student_id 
        INNER JOIN classes ON students.class_id = classes.class_id
        WHERE test_code = '$test_code'";
        $this->set_query($sql);
        return $this->load_rows();
    }
    public function update_profiles($username, $name, $email, $password, $gender, $birthday)
    {
        $sql = "UPDATE admins set email='$email',password='$password', name ='$name', gender_id ='$gender', birthday ='$birthday' where username='$username'";
        $this->set_query($sql);
        $this->execute_return_status();
        return true;
    }
    public function update_avatar($avatar, $username)
    {
        $sql = "UPDATE admins set avatar='$avatar' where username='$username'";
        $this->set_query($sql);
        $this->execute_return_status();
    }
    public function get_total_student()
    {
        $sql = "SELECT COUNT(student_id) as total FROM students";
        $this->set_query($sql);
        return $this->load_row()->total;
    }
    public function get_total_admin()
    {
        $sql = "SELECT COUNT(admin_id) as total FROM admins";
        $this->set_query($sql);
        return $this->load_row()->total;
    }
    public function get_total_class()
    {
        $sql = "SELECT COUNT(class_id) as total FROM classes";
        $this->set_query($sql);
        return $this->load_row()->total;
    }
    public function get_total_question()
    {
        $sql = "SELECT COUNT(question_id) as total FROM questions";
        $this->set_query($sql);
        return $this->load_row()->total;
    }
    public function get_total_test()
    {
        $sql = "SELECT COUNT(test_code) as total FROM tests";
        $this->set_query($sql);
        return $this->load_row()->total;
    }
    public function get_quest_of_test($test_code)
    {
        $sql = "SELECT * FROM `quest_of_test`
        INNER JOIN questions ON quest_of_test.question_id = questions.question_id
        WHERE test_code = $test_code";
        $this->set_query($sql);
        return $this->load_rows();
    }
}
