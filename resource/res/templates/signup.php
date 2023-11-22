<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <?= Config::TITLE ?>
    </title>
    <link rel="stylesheet" href="res/css/style.min.css">
    <link rel="stylesheet" href="res/css/font-awesome.css">
    <link rel="stylesheet" href="res/css/materialize.min.css">
    <script src="res/js/jquery.js"></script>
    <script src="res/js/login.js"></script>
    <script src="res/js/materialize.min.js"></script>
</head>

<body class="bg-login">
    <div id="status" class="status"></div>
    <div class="fade">
        <div class="login fadeInLogin">
            <h4 class="title-login">
                <i id="reload" class="material-icons" onclick="reload()" title="Quay lại">arrow_back</i>
                Đăng Ký
            </h4>
            <div class="login-form">
                <div class="row" style="position: relative;">
                    <img src="/res/img/loading.gif" alt="" id="loading" class="img-loading hidden">
                    <form action="" method="post">
                        <div class="input-field" id="field_username">
                            <input type="text" name="username" id="username" required autofocus>
                            <label for="username" id="lbl_usr">Tên tài khoản</label>
                            <!-- <div class="left-align" style="color: #3c763d;">
                                <span>Tên tài khoản có thể là tên đăng nhập, mã học sinh hoặc email.</span>
                            </div> -->
                        </div>

                        <div class="input-field" id="field_name">
                            <input type="text" name="name" id="name" required autofocus>
                            <label for="name" id="lbl_name">Họ và tên</label>
                            <!-- <div class="left-align" style="color: #3c763d;">
                                <span>Tên tài khoản có thể là tên đăng nhập, mã học sinh hoặc email.</span>
                            </div> -->
                        </div>


                        <div class="input-field" id="field_email">
                            <input type="text" name="email" id="email" required autofocus>
                            <label for="email" id="lbl_email">Email</label>
                            <!-- <div class="left-align" style="color: #3c763d;">
                                <span>Tên tài khoản có thể là tên đăng nhập, mã học sinh hoặc email.</span>
                            </div> -->
                        </div>

                        <div class="input-field" id="field_password">
                            <input type="password" name="password" id="password" required autofocus>
                            <label for="password" id="lbl_password">Password</label>
                            <!-- <div class="left-align" style="color: #3c763d;">
                                <span>Tên tài khoản có thể là tên đăng nhập, mã học sinh hoặc email.</span>
                            </div> -->
                        </div>

                        <div class="input-field" id="field_gender">
                            <label id="lbl_gender">Giới tính</label>

                            <div id="field_gender_option">
                                <label>
                                    <input class="with-gap" name="gender" type="radio" value="male" required>
                                    <span>Nam</span>
                                </label>
                                <label>
                                    <input class="with-gap" name="gender" type="radio" value="female" required>
                                    <span>Nữ</span>
                                </label>
                                <label>
                                    <input class="with-gap" name="gender" type="radio" value="other" required>
                                    <span>Chưa xác định</span>
                                </label>
                            </div>
                        </div>


                        <div class="input-field" id="field_birthday">
                            <input type="text" name="birthday" id="birthday" class="datepicker" required autofocus>

                            <label for="birthday" id="lbl_birthday">Ngày sinh</label>
                        </div>


                        <!-- <div class="input-field" id="field_class">
                            <input type="text" name="class" id="class_student" required autofocus>
                            <label for="class" id="lbl_class">Lớp</label>
                        </div> -->

                        <script>
                            $(document).ready(function() {
                                $('.datepicker').datepicker({
                                    format: 'dd/mm/yyyy', // Định dạng ngày tháng
                                    autoclose: true
                                });
                            });
                        </script>

                        <!--  -->
                        <!-- <div class="left-align" style="color: #3c763d;">
                            <div id="hi" style="display: none;">Xin Chào: <b><span id="hi-text" style="color: blue; font-weight: bold"></span></b>, nhập mật khẩu để tiếp tục.
                            </div>
                        </div>
                        <div class="input-field" id="field_password">
                            <input type="password" name="password" id="password" class="hidden">
                            <label for="password" id="lbl_pw" class="hidden">Mật Khẩu</label>
                        </div> -->

                        <div class="signup-btn">
                            <!-- <button type="submit" class="btn waves-effect waves-light green darken-4"
                                onclick="submit_login()" id="btn-login">Đăng Nhập</button> -->
                            <button class="btn waves-effect waves-light green darken-1" onclick="submit_register()" id="btn-fotgot">Đăng ký
                            </button>

                            <a href="index.php?action=show_login" class="btn waves-effect waves-light orange darken-1" id="btn-login">
                                Đăng nhập
                            </a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>