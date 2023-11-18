function register() {
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    // Gửi yêu cầu Ajax đến server
    $.ajax({
        type: "POST",
        url: "index.php?action=register", // Đường dẫn tới file xử lý đăng ký trên server
        data: { 
            username: username,
            email: email,
            password: password
        },
        success: function(response) {
            // Xử lý kết quả từ server
            alert(response);
        }
    });
}
