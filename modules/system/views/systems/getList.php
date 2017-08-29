<?php 
$formBase = new FormBase();
echo $formBase->create('member/saveAll');
echo $formBase->loadListUrl();
?>
<div class="boxin">						
	<div style="display: block;"><!-- content box 1 for tab switching -->
							
	<fieldset>
	<table>
		<thead><!-- universal table heading -->
			<tr>
                <td class="tc first w20"><input type="checkbox" value="true" class="checkAll" onclick="Common.checkAll(this)"></td>
                <td class="tl"><?php echo __('Name')?></td>
                <th class="tl w120"><?php echo __('Username')?></th>
                <td class="tl w120"><?php echo __('Department')?></td>
                <td class="tc w60"><?php echo __('Status')?></td>
                <td class="tc w80"><?php echo __('Created Date')?></td>
                <td class="tc last w30">&nbsp;</td>
                </tr>
            </thead>
            <tfoot><!-- table foot - what to do with selected items -->
                <tr>
                    <td colspan="15" class="first last">
                    <?php 
                   		$viewdefs = $this->config->item('viewdefs');
						$currentController = $this->router->fetch_class();						
						$curentToolbar = $viewdefs[$currentController]['getList'];
						
						if(!empty($curentToolbar['dropdownTask'])){									
                    ?>
                        <label>                            
                            <?php
                            	echo __("with selected do:");
                            	//array of action. 
                            	$aryOption = $curentToolbar['dropdownTask'];
                            	echo $formBase->dropdown('doAction',array('options'=>$aryOption,'onchange'=>"Common.submitSelect(this)"));
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
                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->memberId,'onclick'=>"Common.isCheckAll(this)"));?>
                    </td>
                    <td class=""><?php echo $item->firstName.' '.$item->lastName?></td>
                    <th><?php echo $item->username?></th>
                    <td><?php echo $item->departmentName;?></td>
                    <td class="tc"><?php echo img_status($item->status,site_url('member/dataSwitch/'.$item->memberId.'/status'));?></td>
                    <td class="tc"><?php echo localDate($item->createdTime);?></td>
                    <td class="tc last ">
                    
                    	<div class="settings-button">
                    		<span class='action-setting'></span>
                    		<div class="toolbar-icons" style="display: none;">							
							    <?php echo ajax_link('member/detail/'.$item->memberId,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                                <?php echo ajax_link('member/edit/'.$item->memberId,'<i class="action-icon-edit"></i>',array('overlay'=>'LBL_EDIT'));?>
                                <?php echo ajax_link('member/delete/'.$item->memberId,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>
						</div>
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