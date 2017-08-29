<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/config/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);

	echo $formBase->hidden('configId');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('configName',array('label'=>"Name",'rules'=>"required",'class'=>'span4'))?>
				<?php echo $formBase->input('configCode',array('label'=>"Code",'rules'=>"required","readonly"=>'readonly','class'=>'span4'))?>


                <?php
                switch($fillData->type){
                    case 'json':
                        echo $formBase->json2('configValue',array('rules'=>"required",'config'=>$fillData->params,'class'=>'span4'));
                        break;
                    case 'upload_image':
                        echo $formBase->{$fillData->type}('configValue',array('label'=>"Value",'rules'=>"required",'class'=>'btn'));
                        break;
                    case 'yesno':
                        echo $formBase->yesno('configValue',array('label'=>"Value",'rules'=>"required"));
                        break;
                    case 'status':
                        echo $formBase->status('configValue',array('label'=>"Value",'rules'=>"required"));
                        break;
                    case 'datetime':
                        echo $formBase->datetime('configValue',array('label'=>"Value",'rules'=>"required"));
                        break;
                    case 'texteditor':
                        echo $formBase->texteditor('configValue',array('label'=>"Value",'class'=>"span4"));
                        break;
                    default:
                        echo $formBase->textarea('configValue',array('label'=>"Value",'rules'=>"required",'class'=>'span4'));
                }
                ?>
		
		
            <div class="form-actions ">
                    <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
                    <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
            </div>

        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>