jQuery(document).ready(function($) {
    var response = $("#response");
    $("#contacto")
        .bind("ajax:success", function(evt, data, status, xhr) {
            var json = jQuery.parseJSON(xhr.responseText);
            response.removeClass();
            if (json.ok){
                response.addClass('alert alert-success');
                response.html('<i class="icon-ok"></i> Su mensaje ha sido enviado correctamente.');
                $("#contacto")[0].reset();
            } else {
                response.addClass('alert alert-error');
                var text = '';
                $.each(json, function(key, value){
                    text += "<i class='icon-warning-sign'></i> " + value + "<br />";
                });
                response.html(text);
            }
            $('html, body').animate({
                scrollTop: response.offset().top
            }, 500);
        })
        .bind("ajax:error", function() {
            response.removeClass();
            response.addClass('alert alert-error');
            response.html('<i class="icon-warning-sign"></i> Hubo un error. Por favor intente nuevamente más tarde.');
        });
});
