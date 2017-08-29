<?php 
$formBase = new FormBase();
echo $formBase->create('system/module/saveAll');
echo $formBase->loadListUrl();

if(is_array($sort)){
	list($sort_key,$sort_dir) = each($sort);
}

?>
<div class="boxin">						
	<div style="display: block;"><!-- content box 1 for tab switching -->
							
	<fieldset>
	<table>
		<thead><!-- universal table heading -->
			<tr>
                <td class="tc first w20"><input type="checkbox" value="true" class="checkAll" onclick="Common.checkAll(this)"></td>
				 <td class="tc w20">
                	<div class="sortable <?php echo ($sort_key =='moduleId')?$sort_dir:'';?>" onclick="Common.sort(this,'moduleId')"><?php echo __('#ID')?></div>
                	</td>
                <td class="tl">
                	<div class="sortable <?php echo ($sort_key =='moduleName')?$sort_dir:'';?>" onclick="Common.sort(this,'moduleName')"><?php echo __('Module Name')?></div>
                	</td>
                             
                <th class="tc w100">
                	<div class="sortable <?php echo ($sort_key =='moduleType')?$sort_dir:'';?>" onclick="Common.sort(this,'moduleType')"><?php echo __('Module Type')?></div>
                </th>
                <td class="tl w100">
                	<div class="sortable <?php echo ($sort_key =='modulePath')?$sort_dir:'';?>" onclick="Common.sort(this,'modulePath')"><?php echo __('Module Path')?></div>
                </td>
                <td class="tc w60">
                	<div class="sortable <?php echo ($sort_key =='status')?$sort_dir:'';?>" onclick="Common.sort(this,'status')"><?php echo __('Status')?></div>
                </td>
                <td class="tc span2">
                	<div class="sortable <?php echo ($sort_key =='createdTime')?$sort_dir:'';?>" onclick="Common.sort(this,'createdTime')"><?php echo __('Created')?></div>
                </td>
                <td class="tc span2">
                	<div class="sortable <?php echo ($sort_key =='updatedTime')?$sort_dir:'';?>" onclick="Common.sort(this,'updatedTime')"><?php echo __('Update')?></div>
                </td>
                <td class="tc last w30">&nbsp;</td>
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
                    	<?php 
                    	if($item->moduleType=='core'){
                    		echo img_lock();
                    	}else{
                    		echo $formBase->checkbox('cid[]',array('value'=>$item->moduleId,'onclick'=>"Common.isCheckAll(this)"));
                    	}
                    	
                    	?>
                    </td>
                    <td class="tc"><?php echo $item->moduleId?></td>
                    <td class="">
                    <div class='bold'>
                    <a title='<?php echo __('LBL_VIEW');?>' href="<?php echo site_url('system/module/detail/'.$item->moduleId)?>">
                    <?php echo $item->moduleName;?>
                    </a>
                    </div>                   
                    <div class='note'><?php echo $item->description;?></div>
                    </td>
                     <td class="tc"><?php echo $item->moduleType;?></td>
                     <td class="tl"><?php echo $item->modulePath;?></td>  
                    <td class="tc"><?php 
                    if($item->moduleType=='core'){
                    	echo img_lock();
                    }else{
                    	echo img_status($item->status,site_url('system/module/dataSwitch/'.$item->moduleId.'/status'));
            		}
                    ?></td>
                   
                    <td class="tc">
                    	<div class="bold"><?php echo $item->createdName?></div>
                    	<div class="note"><?php echo localDate($item->createdTime);?></div>
                    </td>
                    <td class="tc">
                    <div class="bold"><?php echo $item->updatedName?></div>
                    	<div class="note"><?php echo $item->updatedTime;?></div>
                    </td>
                    <td class="tc last ">
                     <?php                     	
	                     if($item->moduleType=='core' && !$LoginData->isSA){
	                     	echo img_lock();
	                     }else{
                     ?>
                    	<div class="settings-button">
                    		<span class='action-setting'></span>
                    		<div class="toolbar-icons" style="display: none;">							
							<a title='<?php echo __('LBL_VIEW');?>' href="<?php echo site_url('system/module/detail/'.$item->moduleId)?>"><i class="action-icon-wrench"></i></a>
							<a title='<?php echo __('LBL_EDIT');?>' onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:'<?php echo __("Edit")?>'})" data-url="<?php echo site_url('system/module/edit/'.$item->moduleId)?>"><i class="action-icon-edit"></i></a>
							<a title='<?php echo __("LBL_DELETE");?>' onclick="return Common.linkSetup(this,{ajax:true,callBack:'reload'})" data-url="<?php echo site_url('system/module/delete/'.$item->moduleId)?>"><i class="action-icon-trash"></i></a>
                           
							
						</div>
                    	</div>
                    	<?php 
	                     }
                    	?>
                        
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
			$(document).ready(function() {				
				
				$(".settings-button").mouseenter(function()
				{
				    $(this).find('.toolbar-icons').fadeIn('fast');

				    $(this).mouseleave(function()
					{
					    $(this).find('.toolbar-icons').fadeOut('fast');
					});

				    $(this).click(function()
					{
				    	$(this).find('.toolbar-icons').hide();
					});
				});

				

			});
</script>