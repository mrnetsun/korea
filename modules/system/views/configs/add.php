<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/config/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('configName',array('label'=>"Name",'rules'=>"required",'class'=>'span4'))?>
				<?php echo $formBase->input('configCode',array('label'=>"Code",'rules'=>"required",'class'=>'span4'))?>
            <?php echo $formBase->dropdown('type',array('label'=>"Type",
                    'options'=>array(
                        'input'=>'Text Box',
                        'upload_image'=>'Image',
                        'upload_photos'=>'Gallery',
                        'upload_document'=>'Document',
                        'upload_documents'=>'Multi Document',
                        'audio'=>'Audio',
                        'date'=>'Date',
                        'datetime'=>'Datetime',
                        'daterange'=>'Date Range',
                        'number'=>'Number',
                        'color'=>'Color',
                        'latlong'=>'Google GPS',
                        'textarea'=>'Text Area',
                        'texteditor'=>'Text Editor',
                        'multiselect'=>'Multi Select',
                        'dropdown'=>'Drop down',
                        'radio'=>'Radio',
                        'checkbox'=>'Check box',
                        'yesno'=>'Yes No',
                        'status'=>'Status',
                        'language'=>'Language')
                    ,'rules'=>"required",'class'=>'span4'))?>
              <?php echo $formBase->textarea('params',array('label'=>"Params",'rows'=>"5",'class'=>'span4'))?>
				<?php echo $formBase->textarea('configValue',array('label'=>"Value",'rules'=>"",'class'=>'span4'))?>
			<?php echo $formBase->yesno('visible',array('label'=>'Visible','checked'=>ACTIVE))?>
		       
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
			<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE')); ?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
