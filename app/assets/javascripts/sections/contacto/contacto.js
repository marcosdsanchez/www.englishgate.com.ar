jQuery(document).ready(function($) {
    $("#send-comment")
        .on("click", function(event) {
            event.preventDefault();
            $("#contacto").submit();
        })
        .on("ajaxStart", function(event) {
            $(this).attr('disabled', 'disabled');
            $(this).html('<i class="icon-refresh icon-spin"></i> Enviando Consulta ...');
        })
        .on("ajaxStop", function(event) {
            $(this).removeAttr('disabled');
            $(this).html('<i class="icon-comment"></i> Enviar Consulta');
        });
    $("#contacto")
        .on("submit", function(event) {
            event.preventDefault();
            var response = $("#response");
            var jqxhr = $.post("/contacto", $('#contacto').serialize())
            .fail(function() {
                response.removeClass();
                response.addClass('alert alert-error');
                response.html('<i class="icon-warning-sign"></i> Hubo un error. Por favor intente nuevamente más tarde.');
            })
            .done(function(rawResponse, textStatus, XMLHttpRequest) {
                var json = jQuery.parseJSON(XMLHttpRequest.responseText);
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
            });
        })
});
