<?php
$formBase = new FormBase();
echo $formBase->create('exam/test/updateComponent',array('ajax'=>array('Callback'=>'testController.cbUpdateComponent'),'class'=>'form-horizontal'));
$formBase->fillData($fillData);
echo $formBase->hidden('test_id',array('id'=>'test_id','value'=>$test_id));
echo $formBase->hidden('test_component_id');
?>
<div class="screenView span7">
    <div style="height:15px;"><h3></h3></div>
    <div class="section ">

        <?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
        <?php echo $formBase->input('point_failure',array('label'=>"LBL_POINT_FAILURE",'rules'=>"required|numeric",'class'=>"span1",'unit'=>' điểm'))?>
        <?php echo $formBase->yesno('display_random',array('label'=>"LBL_RANDOM",'checked'=>1,'rules'=>""))?>
        <?php echo $formBase->yesno('show_title',array('label'=>"LBL_SHOW_TITLE",'checked'=>1,'rules'=>""))?>
        <?php echo $formBase->yesno('show_description',array('label'=>"LBL_SHOW_DESCRIPTION",'rules'=>""))?>
        <?php echo $formBase->texteditor('description',array('label'=>"LBL_DESCRIPTION",'rules'=>"",'class'=>"span4"))?>

        <div class="form-actions ">
            <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
            <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE')); ?>
        </div>
    </div>

</div>
<div class="clear"></div>
<?php echo $formBase->end();?>
