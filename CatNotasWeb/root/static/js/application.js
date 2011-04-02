$(document).ready(function(){
    // Cuando el mouse pasa por encima
    $("div#menu button").hover(function(){
        $(this).css('background-color', '#000');
        $(this).css('cursor', 'pointer');
    // Cuando el mouse se quita de encima 
    }, function(){
        $(this).css('background-color', '#d00');
    });

    $("button#glosario").click(function(){
        $("#contenido_inside").load("glosario.html");
    });
    $("button#inicio").click(function(){
        $("#contenido_inside").load("inicio.html");
    });

    $("div#login").css('width', '400px');
        $("div#login").css('text-align', 'right');
    $("div#login").css('padding', '10px');
    $("div#login").css('margin', '20px');

    $("div#login").parent().parent().width('50%');
    $("div#login").parent().parent().css('margin-left', '220px');


});
