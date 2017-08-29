<?php 
$formBase = new FormBase();
echo $formBase->create('common/importmember/saveAll');
echo $formBase->loadListUrl();

if(is_array($sort)){
	list($sort_key,$sort_dir) = each($sort);
}
?>
<div class="boxin">						
	<div style="display: block;"><!-- content box 1 for tab switching -->
							
	<fieldset>
	<input type="hidden" id ="memberChoseType" value="<?php echo $memberChoseType?>"/>
	<table>
		<thead><!-- universal table heading -->
			<tr>
                <td class="tc first w20">
                	<?php if($memberChoseType == 'checkbox'){?>
                	<input type="checkbox" value="true" class="checkAll" onclick="Common.checkAll(this)">
                	<?php }?>
                	</td>                
                              
					<th class="tl span3">
                    	<div class="sortable <?php echo ($sort_key =='firstName')?$sort_dir:'';?>" onclick="Common.sort(this,'firstName')"><?php echo __("Name");?></div>                    	
                    </th> 
                      <th>
                      <div class="sortable <?php echo ($sort_key =='roleName')?$sort_dir:'';?>" onclick="Common.sort(this,'roleName')"><?php echo __("Role Name");?></div>
                      </th>                       
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='email')?$sort_dir:'';?>" onclick="Common.sort(this,'email')"><?php echo __("LBL_EMAIL");?></div>
                    </th>               
               
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
                    	if($memberChoseType == 'checkbox'){ 
                    		echo $formBase->checkbox('cid[]',array('value'=>$item->memberId,'onclick'=>"Common.isCheckAll(this)"));
                    	}else{
                    		echo $formBase->radio('cid[]',array('value'=>$item->memberId,'onclick'=>"Common.isCheckAll(this)"));
                    	}
                    	echo $formBase->hidden('name',array('value'=>$item->firstName.' '.$item->lastName,'id'=>'name_'.$item->memberId));
                    	?>
                    	
                    </td>
                    
					                    
					<td class="tl">
                    	<div class="bold"><?php echo $item->firstName?> <?php echo $item->lastName?></div>
                    	                   	
                    </td>
						<td><div class="note"><?php echo $item->roleName;?></div> </td>                    
					<td class="tl">
                    	<div><?php echo $item->email?></div>                    	
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