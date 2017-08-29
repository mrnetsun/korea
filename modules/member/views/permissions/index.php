<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="" style="padding: 0px 0px 0px 20px;">
<div class="searchWrap">
<div class="section">
<h4 class="float_left"><?php echo($role->roleName);?></h4>
    <div class="float_rigt">
        <ul class="nav nav-pills nav-gray">
        <?php
//        debug($roles);
        foreach ($roles as $r) {
            $active = ($r->roleId == $role->roleId)?'active':'';
            echo '<li class="'.$active.'">';
            echo anchor('member/role/listItem/'.$r->roleId,$r->roleName);
            echo '</li>';
        }?>
        </ul>
    </div>
    <div class="clear"></div>
</div>
</div>
</div>
<?php //debug($resource[0],false);?>
<div id="<?php echo _getBaseName('List') ?>" class='table-list'>

    <?php echo $formBase->create('member/role/updatePermission/'.$role->roleId,array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="control-group bottom_line" style="background: #f1f1f1;">
        <div class="span2"><?php echo __("LBL_RESOURCE")?></div>
        <div class="span1"><?php echo __("LBL_PERMISSION_FULL")?></div>
        <div class="span1"><?php echo __("LBL_PERMISSION_LISTVIEW")?></div>
        <div class="span1"><?php echo __("LBL_PERMISSION_ADD")?></div>
        <div class="span1"><?php echo __("LBL_PERMISSION_EDIT")?></div>
        <div class="span1"><?php echo __("LBL_PERMISSION_DELETE")?></div>
    </div>
    <?php
//    debug($resource);
    foreach($resource as $source){
        if($source->permissions){
            $available = json_decode($source->permissions);
        }
        else {
            $available = array();
        }

        ?>
        <div class="control-group bottom_line">
            <div class="span2"><?php
                echo $source->resource_name;
                echo $formBase->hidden('resource[]',array('value'=>$source->permision_role_id));

                ?></div>
            <div class="span1"><?php
                if($available)
                    if(in_array('full',$available)){
                    echo $formBase->checkbox('full['.$source->permision_role_id.']',array('value'=>1,'checked'=>$source->full,'onclick'=>'memberController.checkFull(this)','class'=>'full'));
                }else{
                    echo $formBase->hidden('full['.$source->permision_role_id.']',array('value'=>0)); echo "-";
                }
                 ?></div>
            <div class="span1"><?php
                if($available)
                if(in_array('listview',$available)){
                    echo $formBase->checkbox('listview['.$source->permision_role_id.']',array('value'=>1,'checked'=>$source->listView,'onclick'=>'memberController.checkIsFull(this)','class'=>'sub listview'));
                }else{
                    echo $formBase->hidden('listview['.$source->permision_role_id.']',array('value'=>0));echo "-";
                }
                 ?></div>
            <div class="span1"><?php
                if($available)
                if(in_array('add',$available)){
                    echo $formBase->checkbox('add['.$source->permision_role_id.']',array('value'=>1,'checked'=>$source->add,'onclick'=>'memberController.checkIsFull(this)','class'=>'sub add'));
                }else{
                    echo $formBase->hidden('add['.$source->permision_role_id.']',array('value'=>0));echo "-";
                }
                  ?></div>
            <div class="span1"><?php
                if($available)
                if(in_array('edit',$available)){
                    echo $formBase->checkbox('edit['.$source->permision_role_id.']',array('value'=>1,'checked'=>$source->edit,'onclick'=>'memberController.checkIsFull(this)','class'=>'sub edit'));
                }else{
                    echo $formBase->hidden('edit['.$source->permision_role_id.']',array('value'=>0));echo "-";
                }
                 ?></div>
            <div class="span1"><?php
                if($available)
                if(in_array('delete',$available)){
                    echo $formBase->checkbox('delete['.$source->permision_role_id.']',array('value'=>1,'checked'=>$source->delete,'onclick'=>'memberController.checkIsFull(this)','class'=>'sub delete'));
                }else{
                    echo $formBase->hidden('delete['.$source->permision_role_id.']',array('value'=>0));echo "-";
                }
                 ?></div>
        </div>
        <?php
    }
    ?>
    <div class="span2"></div><div class="span2"><?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_UPDATE'))?></div>
    <?php echo $formBase->end();?>
</div>
</div></div>
<div class="clear h20"></div>