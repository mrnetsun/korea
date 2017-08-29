<?php 
$formBase = new FormBase();
echo $formBase->create('system/resource/saveAll');
echo $formBase->loadListUrl();

if(is_array($sort)){
	list($sort_key,$sort_dir) = each($sort);
}
$aryRole = getDBDropdown(array('table'=>'sys_role','key'=>'roleId','val'=>'roleName'));
?>
<div class="boxin">						
	<div style="display: block;"><!-- content box 1 for tab switching -->
							
	<fieldset>
	<table>
		<thead><!-- universal table heading -->
			<tr>
                <td class="tc first w20"><input type="checkbox" value="true" class="checkAll" onclick="Common.checkAll(this)"></td>                
                                    
					<th class="tl w120">
                    	<div class="sortable <?php echo ($sort_key =='moduleId')?$sort_dir:'';?>" onclick="Common.sort(this,'moduleId')"><?php echo __("Module");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='resource_name')?$sort_dir:'';?>" onclick="Common.sort(this,'resource_name')"><?php echo __("Resoure Name");?></div>                    	
                    </th>

				<th class="tc w80">
					<div class="sortable <?php echo ($sort_key =='status')?$sort_dir:'';?>" onclick="Common.sort(this,'status')"><?php echo __("LBL_STATUS");?></div>
				</th>
				<th class="tc span2">
					<div class="sortable <?php echo ($sort_key =='updatedTime')?$sort_dir:'';?>" onclick="Common.sort(this,'updatedTime')"><?php echo __("LBL_UPDATED");?></div>
				</th>

                <td class="tc last span1"><span class='action-setting'></span></td>
                </tr>
            </thead>
            <tfoot><!-- table foot - what to do with selected items -->
                <tr>
                    <td colspan="15" class="first last">
                    <?php                    		
						$currentController = strtolower($this->router->fetch_class());
                    	$viewdefs = $this->config->item($currentController.'_viewdefs');
                   							
						$curentToolbar = $viewdefs['getList'];
						
						if(!empty($curentToolbar['dropdownTask'])){									
                    ?>
                        <label>                            
                            <?php
                            	echo __("With selected do:");
                            	//array of action. 
                            	$aryOption = $curentToolbar['dropdownTask'];
                            	echo $formBase->dropdown('doAction',array('options'=>$aryOption,'onchange'=>'Common.submitSelect(this)'));
                            ?>                            
                        </label>
                        <?php }?>
                        <div class="pagination">
                            <?php echo $pagination->pagingInfo();?>
                            <div class="numberListShowing" style="float: left; margin-left: 10px;">
                                <?php
                                echo $formBase->dropdown('numberListShowing',
                                    array('options'=>$this->config->item('paging_select'),'selected'=>$pagingConfig['per_page'],'onchange'=>'Common.changeNumberListShowing(this)'));?>
                            </div>
                            <?php echo $pagination->create_links($start);?>
                        </div>
                    </td>
                </tr>
            </tfoot>
            <tbody>
            <?php if(!empty($aryData)){
            	$i = 0;
            
            	foreach ($aryData as $item){            		
            		$i++;
            		$first = ($i==1)?'LBL_FIRST':'';
            		$even = ($i%2==0)?'even':'';
            		?>
            		<tr class="<?php echo $first.' '.$even;?>">
                    <td class="tc first">
                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->resource_id,'onclick'=>"Common.isCheckAll(this)"));?>
                    </td>
                    
					                    
					<td class="tl">
                    	<div><?php echo $item->moduleId?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div class="bold"><?php echo $item->resource_name?></div>
                    	<div class="note"><?php echo $item->resource_code?></div>                    	
                    </td>                    
					                

					                   
					<td class="tc">
                    	<div><?php echo img_status($item->status,site_url('system/resource/dataSwitch/'.$item->resource_id.'/status'));?></div>                    	
                    </td>
						<td class="tc">
							<div><?php echo localDate($item->updatedTime);?></div>
						</td>
                    <td class="tc last ">
                    
                    	<div class="settings-button">

							    <?php echo ajax_link('system/resource/detail/'.$item->resource_id,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                                <?php echo ajax_link('system/resource/edit/'.$item->resource_id,'<i class="action-icon-edit"></i>',array('overlay'=>'LBL_EDIT'));?>
                                <?php echo ajax_link('system/resource/delete/'.$item->resource_id,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>

                    	</div>
                    	
                        
                    </td>
                	</tr>
            		<?php 
            		
            	}
            
            	}else{
            		?>
            		<tr><td colspan="15"> <?php echo __('LBL_NO_RECORD');?></td></tr>
            		<?php
            	}
            	?>
                
            </tbody>
        </table>
    </fieldset>
    
</div><!-- .content#box-1-holder -->
</div>
<?php echo $formBase->end();?>



<script type="text/javascript">

</script>