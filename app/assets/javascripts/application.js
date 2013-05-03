//= require jquery/jquery
//= require jquery-ujs/src/rails
//= require bootstrap/js/bootstrap-modal
jQuery(function($) {
    $("#contacto")
    .bind("ajax:success", function(evt, data, status, xhr) {
        json = jQuery.parseJSON(xhr.responseText);
        $("#response").removeClass();
        if (json.ok){
            $("#response").addClass('alert alert-success');
            $("#response").html('<i class="icon-ok"></i> Su mensaje ha sido enviado correctamente.');
            $("#contacto")[0].reset();
        } else {
            $("#response").addClass('alert alert-error');
            text = '';
            $.each(json, function(key, value){
                text += "<i class='icon-warning-sign'></i> " + value + "<br />";
            });
            $("#response").html(text);
        }
        $('html, body').animate({
            scrollTop: $("#response").offset().top
        }, 500);
    })
    .bind("ajax:error", function() {
        $("#response").removeClass();
        $("#response").html('<i class="icon-warning-sign"></i> Hubo un error. Por favor intente nuevamente más tarde.');
    });
});

