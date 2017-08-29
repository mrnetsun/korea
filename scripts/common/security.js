// JavaScript Document
/**
 * @author Lucdt@ideavietnam.com
 */

//disable Right Click
	 $(function() {
            $(this).bind("contextmenu", function(e) {
                e.preventDefault();
            });
        }); 
//end

//Disable Crtl+A,Crtl+C,Crtl+V
$(document).ready(function()
{
    var ctrlDown = false;
    var ctrlKey = 17, vKey = 86, cKey = 67 ,aKey = 65;

    $(document).keydown(function(e)
    {
        if (e.keyCode == ctrlKey) ctrlDown = true;
    }).keyup(function(e)
    {
        if (e.keyCode == ctrlKey) ctrlDown = false;
    });

    $(document).keydown(function(e)
    {
		
        if (ctrlDown && (e.keyCode == vKey || e.keyCode == cKey || e.keyCode == aKey)){
			 e.preventDefault();
		};
    });
});
