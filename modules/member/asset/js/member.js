// JavaScript Document
//LBL_DISPLAY_TO('<?php echo __("Edit");?>');

memberController = {
		
		submitSearchLeter: function(obj){
			obj = $(obj);
			if(obj.hasClass('selected')){
				obj.removeClass('selected');
				$('#letter').val('');
			}else{			
				$('.letterSearchWrap .selected').removeClass('selected');
				obj.addClass('selected');
				$('#letter').val(($(obj).text()));
			}
			$("#btnSearch").trigger("click");
						
			return false;
		},

    updateRole: function(obj){
        if($(obj).val() == 2){
            $('#dealerSelect').show();
        }else{
            $('#dealerSelect').hide();
        }
    },

	checkFull: function (obj) {
		parentRow = $(obj).closest('div.control-group');
		if($(obj).attr('checked')){
			parentRow.find('input[type=checkbox]').attr('checked',true);
		}else{
			parentRow.find('input[type=checkbox]').attr('checked',false);
		}
	},
	checkIsFull:function (obj){
		parentRow = $(obj).closest('div.control-group');
		full = true;

		if(!parentRow.find('input.listview').attr('checked')){full = false};
		if(!parentRow.find('input.add').attr('checked')){full = false};
		if(!parentRow.find('input.edit').attr('checked')){full = false};
		if(!parentRow.find('input.delete').attr('checked')){full = false};

		parentRow.find('input.full').attr('checked',full);
	}
}