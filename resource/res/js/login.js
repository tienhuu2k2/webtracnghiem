$(document).ready(function() {
    $("form").on('submit', function(event) {
        event.preventDefault();
    });
});

function submit_login() {
    $('#loading').css('display', 'inline');
    var url = "index.php?action=submit_login";
    var data = {
        username: $("#username").val()
    };
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            $('#field_username').css('display', 'none');
            $('#lbl_pw').removeClass('hidden');
            $('#password').removeClass('hidden');
            $('#hi').css('display', 'inline');
            $('#hi-text').text(""+ json_data.name +"");
            $('#btn-login').html("Tiếp Tục").css('width', '100%').attr('onclick', 'submit_password()');
            $('#btn-fotgot').css('display', 'none');
            $('#reload').css('display', 'inline');
        }
        $('#loading').css('display', 'none');
    };
    $.post(url, data, success);
}

function submit_register() {
    $('#loading').css('display', 'inline');
    var url = "index.php?action=submit_register";
    
    // Lấy giá trị từ các trường input
    var username = $("#username").val();
    var name = $("#name").val();
    var email = $("#email").val();
    var password = $("#password").val();
    var gender = $("input[name='gender']:checked").val();
    var birthday = $("#birthday").val();
    var class_student = $("#class_student").val();



    // Log giá trị của các trường input
    console.log("Username: " + username);
    console.log("Name: " + name);
    console.log("Email: " + email);
    console.log("Password: " + password);
    console.log("Gender: " + gender);
    console.log("Birthday: " + birthday);
    console.log("class_student: " + class_student);
    

    var data = {
        username: username,
        name: name,
        email: email,
        password: password,
        gender: gender,
        birthday: birthday,
        class_student: class_student,
    };

    var success = function(result) {
        console.log(result); // Thêm dòng này
        var json_data = $.parseJSON(result);
        show_status(json_data);
        $('#loading').css('display', 'none');
    };

    $.post(url, data, success);
}

// $("#avatar").on("change", function() {
//     // Lấy đối tượng File
//     var file = $(this)[0].files[0];
    
//     // Log tên file
//     console.log("Avatar: " + file.name);

//     // Nếu bạn muốn lưu giá trị vào biến Avatar, hãy thực hiện ở đây
//     // var avatar = file;
// });

// // Cập nhật hàm submit_register
// function submit_register() {
//     $('#loading').css('display', 'inline');
//     var url = "index.php?action=submit_register";
    
//     // Lấy giá trị từ các trường input
//     var username = $("#username").val();
//     var name = $("#name").val();
//     var email = $("#email").val();
//     var password = $("#password").val();
//     var gender = $("input[name='gender']:checked").val();
//     var birthday = $("#birthday").val();

//     // Nếu bạn muốn lấy giá trị Avatar ở đây, hãy thực hiện
//     var avatar = $("#avatar")[0].files[0];

//     var data = {
//         username: username,
//         name: name,
//         email: email,
//         password: password,
//         gender: gender,
//         birthday: birthday,
//         avatar: avatar,
//     };

//     var success = function(result) {
//         console.log(result);
//         var json_data = $.parseJSON(result);
//         show_status(json_data);
//         $('#loading').css('display', 'none');
//     };

//     $.post(url, data, success);
// }

function reload() {
    $('#reload').css('display', 'none');
    $('#field_username').css('display', 'inline');
    $('#hi').css('display', 'none');
    $('#lbl_pw').addClass('hidden');
    $('#password').addClass('hidden');
    $('#btn-login').html("Tiếp Tục").css('width', '100%').attr('onclick', 'submit_login()');
}
function submit_password() {
    $('#loading').css('display', 'inline');
    var url = "index.php?action=submit_password";
    var data = {
        password: $("#password").val()
    };
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            setTimeout(function() {
                location.reload('index.php');
            }, 1500);
        }
        $('#loading').css('display', 'none');
    };
    $.post(url, data, success);
}



function show_status(json_data) {
    if (json_data.status) {
        $('#status').addClass('success');
        $('#status').removeClass('failed');
    } else {
        $('#status').addClass('failed');
        $('#status').removeClass('success');
    }
    $('#status').html(json_data.status_value);
    $('#status').animate({
        'height': '65',
        'line-height': '65px',
        'opacity': '1'
    }, 500);
    $('#status').delay(1000).animate({
        'opacity': '0',
        'height': '0',
        'line-height': '0px'
    }, 500);
}