//omajinai
(function() {
'use strict';

//code
$('#generate_password').on('click', function(event) {
    var data = {};
    // create JSON data
    $('#password_generate_options').find('input,select').each(function(i) {
        data[$(this).attr('name')] = $(this).val();
    });
    // ajax POST
    $.ajax({
        url: '/api/pwgen/pwgen.json',
        method: 'post',
        dataType: 'json',
        data: JSON.stringify(data),
        cache: false,
        contentType: 'application/json'
    }).done(function( res ) {

        $('#generate_password_form').find('input').each(function(i) {
            $(this).attr('value', res[$(this).attr('name')])
        });
        console.log('success', res)
    }).fail(function( jqXHR, textStatus, errorThrown ) {
        console.log('error', res)
    });
});
//end code

// omajinai
})();
