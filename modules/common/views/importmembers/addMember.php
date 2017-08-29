<?php
$formBase = new FormBase();

$formBase->fillData($arySearch);

?>
<div class="message warning">
    <div class="searchWrap">
        <div class="section">
            <?php echo $formBase->create('common/importmember/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
            <input type="hidden" name="search" value="1" />
            <?php echo $formBase->input('firstName',array('placeholder'=>"Name",'class'=>"span2"))?>
            <?php echo $formBase->input('email',array('placeholder'=>"LBL_EMAIL",'class'=>"span2"))?>


            <?php echo $formBase->submit('search',array('label'=>'BTN_SEARCH'))?>
            <?php echo $formBase->clear('clear',array('label'=>'BTN_CLEAR'))?>

            <?php echo $formBase->end();?>
        </div>
    </div>
</div>
<div>
    <div id="<?php echo _getBaseName('List') ?>" class='table-list'>
        <?php echo $htmlList;?>
    </div>
    <div class="clear h10"></div>
    <?php echo 'Roles Project :'?>
    <div class="clear h10"></div>
    <?php echo $formBase->dropdown('rolesProject', array('options'=>sysDropdown('ProjectDropdown',FALSE),'id'=>"rolesProjects"));?>
    <div class="clear h10"></div>
    <?php echo $formBase->button('import',array('label'=>'Add Member','onclick'=>"Common.importMemberRadio(this);"));?>

    <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
</div>
