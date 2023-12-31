$(function() {
    get_list_tests();
    select_class();
    list_unit();
    $('#add_test_form').on('submit', function() {
        submit_add_test($('#add_test_form').serializeArray());
        $('#add_test_form')[0].reset();
    });
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
    var url = "index.php?action=delete_check_tests";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        $('#table_tests').DataTable().destroy();
        get_list_tests();
        $('#select_all').prop('checked',false);
        $('#select_action').addClass('hidden');
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
    
}

function get_list_tests() {
    $('#preload').removeClass('hidden');
    var url = "index.php?action=get_list_tests";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_list_tests(json_data);
        $('select').select();
        $('#preload').addClass('hidden');
    };
    $.get(url, success);
}

function show_list_tests(data) {
    var list = $('#list_tests');
    list.empty();
    select_class();
    for (var i = 0; i < data.length; i++) {
        var tr = $('<tr class="" id="test-' + data[i].test_code + '"></tr>');
        tr.append('<td class="">' + data[i].test_name + '</td>');
        tr.append('<td class="">' + data[i].test_code + '</td>');
        tr.append('<td class="">' + data[i].class_name + '</td>');
        tr.append('<td class="">' + data[i].total_questions + ' câu hỏi, thời gian ' + data[i].time_to_do + ' phút <br />Ghi chú: ' + data[i].note + '</td>');
        tr.append('<td class="">' + data[i].status + '</td>');
        tr.append('<td class="">' + toggle_status_button(data[i]) + '<br />' + test_detail_button(data[i])+ '<br />' + test_del_button(data[i]) + '</td>');
        list.append(tr);
    }
    $('#table_tests').DataTable( {
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
        { "bSortable": false, "aTargets": [ 0, 2, 5 ] }, //hide sort icon on header of column 0, 5
        ],
        'aaSorting': [[1, 'asc']]
    } );
    $("form").on('submit', function(event) {
        event.preventDefault();
    });
}

function toggle_status_button(data) {
    return btn = '<a class="waves-effect waves-light btn" style="margin-bottom: 7px;" onclick="toggle_status(' + data.test_code + ', ' + data.status_id + ')">Đóng/Mở</a>';
}

function test_detail_button(data) {
    return btn = '<a class="waves-effect waves-light btn" style="margin-bottom: 7px;" href="index.php?action=test_detail&test_code=' + data.test_code + '">Chi Tiết Đề</a>';
}

function test_del_button(data) {
    return btn = '<a class="waves-effect waves-light btn modal-trigger" href="#del-' + data.test_code + '" id="#del-' + data.test_code + '">Xóa</a>' +
    '<div id="del-' + data.test_code + '" class="modal"><div class="modal-content">' +
    '<h5>Cảnh Báo</h5><p>Xác nhận xóa ' + data.test_name + '</p></div>' +
    '<form action="" method="POST" role="form" onsubmit="submit_del_test(this.id)" id="form-del-test-' + data.test_code + '">' +
    '<div class="modal-footer"><a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Trờ Lại</a>' +
    '<input type="hidden" value="' + data.test_code + '" name="test_code">' +
    '<button type="submit" class="waves-effect waves-green btn-flat modal-action modal-close">Đồng Ý</button></div></form></div>';
}

function submit_add_test(data) {
    $('#preload').removeClass('hidden');
    var url = "index.php?action=check_add_test";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            $('#table_tests').DataTable().destroy();
            get_list_tests();
            $('select').select();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function toggle_status(test_code,status_id) {
    $('#preload').removeClass('hidden');
    if(status_id == 1)
        var data  = {
            test_code: test_code,
            status_id : 2
        }
    if(status_id == 2)
        var data  = {
            test_code: test_code,
            status_id : 1
        }
    var url = "index.php?action=check_toggle_test_status";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            $('#table_tests').DataTable().destroy();
            get_list_tests();
            $('select').select();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function list_unit() {
    $('#preload').removeClass('hidden');
    var class_id = $('#class_id').val();
    if(class_id == null)
        class_id = 1;
    var data = {
        class_id: class_id,
    }
    var div = $('#list_unit');
    var url = "index.php?action=get_list_units";
    var success = function(result) {
        div.empty();
        var json_data = $.parseJSON(result);
        if(json_data == "")
            div.append('<span class="title">Chưa có câu hỏi cho khối và môn đã chọn!</span>');
        else {
            for (var i = 0; i < json_data.length; i++) {
                var ip = '<div class="input-field">' +
                        '<label for="'+ json_data[i].unit +'">Chương '+ json_data[i].unit +' (tổng số '+ json_data[i].total +' câu)</label>' +
                        '<input class="unit" type="number" id="'+ json_data[i].unit +'" name="'+ json_data[i].unit +'" onchange="update_total()" max="'+ json_data[i].total +'" min="0">' +
                        '</div>';
                div.append(ip);
            }
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}

function update_total() {
    var sum = 0;
    $('.unit').each(function () {
        if (parseInt(this.value) > parseInt(this.getAttribute("max")))
            {
                alert("Nhập quá số câu hỏi đang có, vui lòng kiểm tra lại");
                this.value = this.getAttribute("max");
                sum += parseInt(this.value);
            }
        else if (this.value != "")
            sum += parseInt(this.value);
        });
    $('#total_questions').val(sum);
}

function submit_del_test(data) {
    $('#preload').removeClass('hidden');
    data = $('#' + data).serializeArray();
    var url = "index.php?action=check_del_test";
    var success = function(result) {
        var json_data = $.parseJSON(result);
        show_status(json_data);
        if (json_data.status) {
            $('#table_tests').DataTable().destroy();
            get_list_tests();
        }
        $('#preload').addClass('hidden');
    };
    $.post(url, data, success);
}