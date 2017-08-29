<?php
$formBase = new FormBase();
$formBase->fillData($arySearch);
?>
<div class="main">
	<div class="shell">
		<div class="message warning">
			<div class="searchWrap">
				<div class="section">
					<?php echo $formBase->create('member/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
					<input type="hidden" name="search" value="1" />
					<?php echo $formBase->input('q',array('placeholder'=>'Tên,email, username'));?>
					<?php echo $formBase->dropdown('roleId',
						array('options'=>getDBDropdown(array('table'=>'sys_role',
							'key'=>'roleId',
							'val'=>'roleName'
						))
						,'empty'=>'LBL_ALL_ROLES'));?>
					<?php echo $formBase->dropdown('clientId',
						array('options'=>getDBDropdown(array('table'=>'client',
							'key'=>'id',
							'val'=>'name'
						))
						,'empty'=>'LBL_ALL_CLIENT'));?>
					<?php echo $formBase->dropdown('status',
						array('options'=>getDropdownStatus()
						,'empty'=>'LBL_ALL_STATUS'));?>
					<?php echo $formBase->submit('search',array('id'=>"btnSearch",'label'=>'BTN_SEARCH'))?>
					<?php echo $formBase->clear('clear',array('id'=>"clearSearch",'label'=>'BTN_CLEAR'))?>

					<?php echo $formBase->end();?>
				</div>
			</div>
		</div>
		<div id="<?php echo _getBaseName('List') ?>" class='table-list'>
			<?php echo $htmlList;?>
		</div>
	</div>
</div>