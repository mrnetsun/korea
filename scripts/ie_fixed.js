$(document).ready(function(){
    $('.Form').find("input[type=text], textarea").each(function(ev)
    {
        //fix placeholder attribute
        if(!$(this).val()) {
            var $placeholder = $(this).attr("placeholder");
            if($placeholder){

                var label = $(this).parent().prev();
                if(label.text() != $placeholder){
                    var span = $('<span style="padding: 5px;"></span>');
                    span.html($placeholder);
                    $(this).before(span);
                }

            }
        }
    });

    $('.Form').submit(function(){
        //fix ajax commit
        if($(this).attr('data-url')){
            return false;
        }
    });
});
