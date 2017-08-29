<div class='main'><div class='shell shellWrap'>
<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/module/insert',array('class'=>'form-horizontal'));
	$formBase->fillData($fillData);
?>
    <div class="screenView">
        
        <div>
        	 <fieldset><legend><?php echo __("Module Information")?></legend>           
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Title");?>  
            </label>
               <div class="controls"> <?php echo $formBase->input('moduleName',array('rules'=>'required'));?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Description");?>  
            </label>
               <div class="controls"> <?php echo $formBase->textarea('description',array('rows'=>5, 'cols'=>60));?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Type");?>  
            </label>
               <div class="controls"><?php
               echo __("Extend"); 
              
               echo $formBase->hidden('moduleType',array('value'=>'extend'));
               ?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Name");?>  
            </label>
               <div class="controls"> <?php echo $formBase->input('modulePath');?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("LBL_STATUS");?>
            </label>
               <div class="controls"> 
               	<?php echo $formBase->dropdown('status',array('options'=>getDropdownStatus()));?></div>
            </div>
            </fieldset>
            <fieldset><legend><?php echo __("Database Config")?></legend>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Table Name");?>  
            </label>
               <div class="controls"> 
               	<?php echo $formBase->input('tableName',
               					array('class'=>"tableName", 'onchange'=>"systemController.getTableField(this)"));?>
               					<a class="pointer button-icon" onclick="systemController.getTableField($('.tableName'));">
               					<span class="toolbar_icon-16 toolbar_icon-16-clear"></span></a>
               	</div>
            </div>
            
             <div class="control-group">
            <label class="control-label">
                <?php echo __("Primary Key");?>  
            </label>
               <div class="controls"> 
               		<?php echo $formBase->input('primaryKey',
               					array('class'=>"primaryKey"));?></div>
            </div>
            
            </fieldset>
            
            <fieldset class="screenSetting"><legend><?php echo __("Screen Setting");?></legend>
            <div>
            	<table width="100%" class="tableList">
                	<thead>
                    <tr>
                    	<th class="w200 tl"><?php echo __("Table Field")?></th>
                        <th class="w40"></th>
                        <th class="tl"><?php echo __("Add/Edit Field")?></th>                        
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    	<td  valign="top">
                        	<select id="tableField1" name="tableField1[]" class="tableField w200" style="height:235px;" multiple="multiple">
                            </select>
                        </td>
                        <td valign="top">
                        	<button type="button" id="moveRight1"  onclick="systemController.moveRightAddEdit(this)">&gt;&gt;</button>
                            
                        </td>
                        <td valign="top">
                        <ul>
                        	<li class="w30">[X]</li>
							<li class="w140"><?php echo __("Field Name")?></li>
							<li class="w140"><?php echo __("Label")?></li>
							<li class="w140"><?php echo __("Input Type")?></li>
							<li class="w140"><?php echo __("Validate")?></li>
                        </ul>
                        <div id="tableField1Wrap" class="w600 overy border" style="height:200px;">
                        
                        </div>
                        </td>                        
                    </tr>
                    </tbody>
                </table>
            </div>
            
            <div>
            	<table width="100%" class="tableList">
                	<thead>
                    <tr>
                    	<th class="w200 tl"><?php echo __("Table Field")?></th>
                        <th class="w40"></th>
                        <th class="tl"><?php echo __("List/Search Field")?></th>                       
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    	<td valign="top">
                        	<select id="tableField2" name="tableField2[]" class="tableField w200" style="height:235px;" multiple="multiple">
                            </select>
                        </td>
                        <td valign="top">
                        	<button type="button" id="moveRight2" onclick="systemController.moveRightSearch(this)">&gt;&gt;</button>
                            
                        </td> 
                        <td valign="top">
                        <ul>
                        	<li class="w30">[X]</li>
							<li class="w140"><?php echo __("Field Name")?></li>
							<li class="w140"><?php echo __("Label")?></li>
							<li class="w140"><?php echo __("Searchable")?></li>
							<li class="w140"><?php echo __("Sortabel")?></li>
                        </ul>
                        <div id="tableField2Wrap" class="w600 overy border" style="height:200px;">
                        
                        </div>
                        </td>                       
                    </tr>
                    </tbody>
                </table>
            </div>
            </fieldset>
                     
        </div>
        
<div class="actions ">
    
            <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
            <?php echo $formBase->back('BTN_BACK',site_url('system/module'),array('label'=>'BTN_BACK'))?>
    
</div> 
<!-- End of .content -->
    
    
</div>
</div></div>
<?php echo $formBase->end();?>
			
