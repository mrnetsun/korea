<?php 
	$formBase = new FormBase();
	echo $formBase->create('member/update',array('ajax'=>_getBaseName('List')));
	$formBase->fillData($fillData);
	echo $formBase->hidden('memberId');
?>
<div class="w500">

    <div class="section ">
        <label>
            <?php echo __("First Name");?>
        </label>
        <div>
            <?php echo $formBase->input('firstName',array('class'=>'span4'))?>
        </div>
    </div>

    <div class="section ">
        <label>
            <?php echo __("Last Name");?>
        </label>
        <div>
            <?php echo $formBase->input('lastName',array('class'=>'span4'))?>
        </div>
    </div>

    <div class="section ">
        <label>
            <?php echo __("Department");?>
        </label>
        <div>
            <?php echo $formBase->dropdown('departmentId',$aryDept);?>
        </div>
    </div>

    <div class="section ">
        <label>
            <?php echo __("Address");?>
        </label>
        <div>
            <?php echo $formBase->input('address')?>
        </div>
    </div>

    <div class="section ">
        <label>
            <?php echo __("LBL_EMAIL");?>
        </label>
        <div>
            <?php echo $formBase->input('email')?>
        </div>
    </div>

    <div class="section ">
        <label>
            <?php echo __("LBL_STATUS");?>
        </label>
        <div>
            <?php echo $formBase->checkbox('status',1)?>
        </div>
    </div>

    <div class="actions ">

        <?php
        echo $formBase->submit('BTN_SUBMIT');
        ?>
        <?php
        echo $formBase->reset('reset');
        ?>


    </div> <!-- End of .content -->


</div>

<?php echo $formBase->end();?>
			
