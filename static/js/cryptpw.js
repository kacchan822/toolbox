//omajinai
(function() {
'use strict';

//code

$('.line-add').on('click', function(event) {
    var row_count = $('#t_body').find('tr').length;
    var $row = $('#t_body').find('tr:first').clone().removeClass('error_row sucsess_row');
    $('#t_body').append($row);
    $('#t_body').find('tr:last').find('input').val('');
});


$('.line-del').on('click', function(event) {
    var row_count = $('#t_body').find('tr').length;
    if (row_count > 1) {
        $('#t_body').find('tr:last').remove();
    }
});


$('#form_reset').on('click', function(event) {
    $('form')[0].reset();
    $('tr').removeClass('error_row sucsess_row');
});


$('#crypt_password').on('click', function(event) {
    var datas = [];

    // create JSON data
    $('#crypt_password_form').find('tr').each(function(i) {
        var data = {};
        $(this).find('input,select').each(function (i) {
            data[$(this).attr('name')] = $(this).val();
        });
        if (Object.keys(data).length) {
            datas.push(data);
        }
    });

    // ajax POST
    $.ajax({
        url: '/api/cryptpw/cryptpw.json',
        method: 'post',
        dataType: 'json',
        data: JSON.stringify(datas),
        cache: false,
        contentType: 'application/json'
    }).done(function( res ) {
        $('form').find('input,select').val('');
        for ( var i = 0 ; i < res.length ; i++ ) {
            var $row = $('#t_body').find('tr').eq(i);
            if (res[i]['check'] === false) {
                $row.removeClass('sucsess_row');
                $row.addClass('error_row');
            } else {
                $row.removeClass('error_row');
                $row.addClass('sucsess_row');
            }
            $row.find('.plain_password').val(res[i]['plain_password']);
            $row.find('.crypted_password').val(res[i]['crypted_password']);
            if (res[i]['crypt_method'] === '1') {
                $row.find('select#crypt_method').val('1')
            } else if (res[i]['crypt_method'] === '5') {
                $row.find('select#crypt_method').val('5')
            } else if (res[i]['crypt_method'] === '6') {
                $row.find('select#crypt_method').val('6')
            } else {
                $row.find('select#crypt_method').val('0')
            }
        };
        // console.log('success', res);
    }).fail(function( jqXHR, textStatus, errorThrown ) {
        // console.log('error', res);
    });
});
//end code

// omajinai
})();
