$(function() {
    $('#table_students').DataTable().destroy();
    get_list_students();
    select_class();
    $('.tabs').tabs();
    $('#add_student_form').on('submit', function() {
        submit_add_student($('#add_student_form').serializeArray());
        $('#add_student_form')[0].reset();
    });
    // $('#add_via_file').on('submit', function() {
    //     $('#preload').removeClass('hidden');
    //     submit_add_student_via_file();
    //     $('#add_via_file')[0].reset();
    //     $('#preload').addClass('hidden');
    // });
    $('#select_all').on('change', function() {
        if(this.checked){
            $('.checkbox').each(function(){
                this.checked = true;
            });
            $('#select_action').removeClass('hidden');
        }else{
            $('.checkbox').each(function(){
                this.checked = false;
            });
            $('#select_action').addClass('hidden');
        }
    });
    $('table').on('click', 'a.modal-trigger', function(){
        $('select').select();
        select_class();
        var elem = document.querySelector(this.id);
        var instance = M.Modal.init(elem);
        var instance = M.Modal.getInstance(elem);
        instance.open();
    });
});

function check_box() {
    $('#select_action').removeClass('hidden');
    if($('.checkbox:checked').length == $('.checkbox').length){
        $('#select_all').prop('checked',true);
    }else{
        $('#select_all').prop('checked',false);
    }
    if($('.checkbox:checked').length == 0) {
        $('#select_action').addClass('hidden');
    }
}

function delete_check() {
    var _list_check = '';
    $('.checkbox:checked').each(function(){
        _list_check += this.value + ','
    });
    data = {
        list_check : _list_check
    }
    $('#preload').removeClass('hidden');
    var url = "index.php?action=delete_check_students";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        $('#table_students').DataTable().destroy();
        get_list_students();
        $('#select_all').prop('checked',false);
        $('#select_action').addClass('hidden');
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
    
}

function get_list_students() {
    $('#preload').removeClass('hidden');
    var url = "index.php?action=get_list_students";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_list_students(json_data);
        $('.modal').modal();
        $('select').select();
        $('#preload').addClass('hidden');
    };
    $.get(url, success);
}

function show_list_students(data) {
    var list = $('#list_students');
    list.empty();
    select_class();
    for (var i = 0; i < data.length; i++) {
        var tr = $('<tr class="fadeIn" id="student-' + data[i].student_id + '"></tr>');
        tr.append('<td class=""><p><label><input type="checkbox" name="checkbox_students" class="checkbox" onchange="check_box();" value="' + data[i].student_id + '" /><span></span></label></p></td>');
        tr.append('<td class="">' + data[i].student_id + '</td>');
        tr.append('<td class=""><img src="res/img/avatar/' + data[i].avatar + '" alt="avatar" class="avatar" /></td>');
        tr.append('<td class="">' + data[i].name + '</td>');
        tr.append('<td class="">' + data[i].username + '</td>');
        tr.append('<td class="">' + data[i].email + '</td>');
        tr.append('<td class="">' + data[i].gender_detail + '</td>');
        if(data[i].birthday == '' || data[i].birthday == '0000-00-00')
            data[i].birthday = 'Chưa Xác Định';
        tr.append('<td class="">' + data[i].birthday + '</td>');
        if(data[i].last_login == '' || data[i].last_login == '0000-00-00 00:00:00')
            data[i].last_login = 'Chưa Đăng Nhập';
        tr.append('<td class="">' + data[i].last_login + '</td>');
        tr.append('<td class="">' + student_edit_button(data[i]) + '<br />' + student_del_button(data[i]) + '</td>');
        list.append(tr);
    }
    $('#table_students').DataTable( {
        "language": {
            "lengthMenu": "Hiển thị _MENU_",
            "zeroRecords": "Không tìm thấy",
            "info": "Hiển thị trang _PAGE_/_PAGES_",
            "infoEmpty": "Không có dữ liệu",
            "emptyTable": "Không có dữ liệu",
            "infoFiltered": "(tìm kiếm trong tất cả _MAX_ mục)",
            "sSearch": "Tìm kiếm",
            "paginate": {
                "first":      "Đầu",
                "last":       "Cuối",
                "next":       "Sau",
                "previous":   "Trước"
            },
        },
        "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0, 2, 9 ] }, //hide sort icon on header of column 0, 2, 10
        ],
        'aaSorting': [[1, 'asc']] // start to sort data in second column
    } );
    $("form").on('submit', function(event) {
        event.preventDefault();
    });
}
function student_edit_button(data) {
    return btn = '<a class="waves-effect waves-light btn modal-trigger" style="margin-bottom: 7px;" href="#edit-' + data.student_id + '" id="#edit-' + data.student_id + '">Sửa</a>' +
    '<div id="edit-' + data.student_id + '" class="modal modal-edit">' +
    '<div class="row col l12">' +
    '<form action="" method="POST" role="form" id="form-edit-student-' + data.student_id + '">' +
    '<div class="modal-content"><h5>Sửa: ' + data.name + '</h5>' +
    '<div class="modal-body">' +
    '<div class="col l6 s12">' +
    '<div class="input-field">' +
    '<input type="hidden" value="' + data.student_id + '" name="student_id">' +
    '<input type="hidden" value="' + data.username + '" name="username">' +
    '<input type="text" value="' + data.name + '" name="name" required>' +
    '<label for="name" class="active">Tên</label>' +
    '</div>' +
    '<div class="input-field">' +
    '<input type="password" name="password" required>' +
    '<label for="password">Mật Khẩu</label>' +
    '</div>' +
    '</div>' +
    '<div class="col l6 s12">' +
    '<div class="input-field">' +
    '<select name="gender_id">' +
    '<option value="1" selected>Không Xác Định</option>' +
    '<option value="2">Nam</option>' +
    '<option value="3">Nữ</option>' +
    '</select>' +
    '<label>Giới Tính</label>' +
    '</div>' +
    '<div class="input-field">' +
    '<input type="date" value="' + data.birthday + '" name="birthday" required>' +
    '<label for="birthday" class="active">Ngày Sinh</label>' +
    '</div>' +
    '</div>' +
    '</div></div>' +
    '</div><div class="col l12 s12">' +
    '<div class="modal-footer">' +
    '<a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Trở Lại</a>' +
    '<button type="submit" class="waves-effect waves-green btn-flat" onclick="submit_edit_student(' + data.student_id + ')">Đồng Ý</button>' +
    '</div></div></form></div></div>';
}

function student_del_button(data) {
    return btn = '<a class="waves-effect waves-light btn modal-trigger" href="#del-' + data.student_id + '" id="#del-' + data.student_id + '">Xóa</a>' +
    '<div id="del-' + data.student_id + '" class="modal"><div class="modal-content">' +
    '<h5>Cảnh Báo</h5><p>Xác nhận xóa tài khoản ' + data.username + '</p></div>' +
    '<form action="" method="POST" role="form" onsubmit="submit_del_student(this.id)" id="form-del-student-' + data.student_id + '">' +
    '<div class="modal-footer"><a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Trờ Lại</a>' +
    '<input type="hidden" value="' + data.student_id + '" name="student_id">' +
    '<button type="submit" class="waves-effect waves-green btn-flat modal-action modal-close">Đồng Ý</button></div></form></div>';
}

function submit_add_student(data) {
    $('#preload').removeClass('hidden');
    var url = "index.php?action=check_add_student";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            // student_insert_data(json_data);
            $('#table_students').DataTable().destroy();
            get_list_students();
            $('.modal').modal();
            $('select').select();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function submit_del_student(data) {
    $('#preload').removeClass('hidden');
    data = $('#' + data).serializeArray();
    var url = "index.php?action=check_del_student";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            $('#table_students').DataTable().destroy();
            get_list_students();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function submit_edit_student(data) {
    $('#preload').removeClass('hidden');
    form = $('#form-edit-student-' + data);
    data = $('#form-edit-student-' + data).serializeArray();
    var url = "index.php?action=check_edit_student";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            // $('#student-' + json_data.student_id).remove();
            // student_insert_data(json_data);
            $('#table_students').DataTable().destroy();
            get_list_students();
            form[0].reset();
            $('.modal').modal();
            $('select').select();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

// function student_insert_data(data) {
//     var list = $('#list_students');
//     var tr = $('<tr class="fadeIn" id="student-' + data.student_id + '"></tr>');
//     tr.append('<td class="">' + data.student_id + '</td>');
//     tr.append('<td class=""><img src="res/img/avatar/' + data.avatar + '" alt="avatar" class="avatar" /></td>');
//     tr.append('<td class="">' + data.name + '</td>');
//     tr.append('<td class="">' + data.username + '</td>');
//     tr.append('<td class="">' + data.class_name + '</td>');
//     tr.append('<td class="">' + data.email + '</td>');
//     tr.append('<td class="">' + data.gender_detail + '</td>');
//     tr.append('<td class="">' + data.birthday + '</td>');
//     tr.append('<td class="">' + data.last_login + '</td>');
//     tr.append('<td class="">' + student_edit_button(data) + '<br />' + student_del_button(data) + '</td>');
//     list.append(tr);
//     select_class();
//     $("form").on('submit', function(event) {
//         event.preventDefault();
//     });
// }