<!DOCTYPE html>
<html lang="en">
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
}

input {
    padding: 8px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
</style>
< <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?=Config::TITLE?></title>
    <link rel="stylesheet" href="res/css/style.min.css">
    <link rel="stylesheet" href="res/css/font-awesome.css">
    <link rel="stylesheet" href="res/css/materialize.min.css">
    <script src="res/js/jquery.js"></script>
    <script src="res/js/register.js"></script>
    <script src="res/js/materialize.min.js"></script>
    </head>

    <body>
        <div class="container">
            <form id="registrationForm">
                <h2>Đăng ký</h2><label for="username">Tên đăng nhập:</label><input type="text" id="username"
                    name="username" required><label for="email">Email:</label><input type="email" id="email"
                    name="email" required><label for="password">Mật khẩu:</label><input type="password" id="password"
                    name="password" required><button type="button" onclick="register()">Đăng ký</button>
            </form>
        </div>
    </body>

</html>