<?php
 //localTime
 //img_status($item->status,site_url('solr/log/dataSwitch/'.$item->log_id.'/status'));

$formBase = new FormBase();
echo $formBase->create('system/log/saveAll');
echo $formBase->loadListUrl();

if(is_array($sort)){
	list($sort_key,$sort_dir) = each($sort);
}

$aryLogType = array(0=>'info',1=>'warning',2=>'danger');

?>
<div class="boxin">						
	<div style="display: block;"><!-- content box 1 for tab switching -->
							
	<fieldset>
	<table>
		<thead><!-- universal table heading -->
			<tr>
                <td class="tc first w20">
					<?php echo __('LBL_ID'); ?>
				</td>


				<th class="tl span1">
					<div class="sortable <?php echo ($sort_key =='type')?$sort_dir:'';?>" onclick="Common.sort(this,'type')"><?php echo __("LBL_TYPE");?></div>
				</th>
				<th class="tl span2">
					<div class="sortable <?php echo ($sort_key =='actor')?$sort_dir:'';?>" onclick="Common.sort(this,'actor')"><?php echo __("LBL_ACTOR");?></div>
				</th>
				<th class="tc span1">
					<div class="sortable"><?php echo __("LBL_ITEM");?></div>
				</th>
				<th class="tl">
                    	<div class="sortable"><?php echo __("LBL_FUNCTION");?>/<?php echo __("LBL_ACTION");?>/<?php echo __("LBL_COMMENT");?></div>
                    </th>                    

					<th class="tl span2">
                    	<div class="sortable <?php echo ($sort_key =='updatedTime')?$sort_dir:'';?>" onclick="Common.sort(this,'updatedTime')"><?php echo __("LBL_UPDATED");?></div>
                    </th>               
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
					$cur_page = $pagination->cur_page;
					$per_page = $pagination->per_page;
					$numOrderRecord = ($cur_page-1)*$per_page;
            		?>
            		<tr class="<?php echo $first.' '.$even;?>">
                    <td class="tc first">
						<?php echo $item->log_id; ?>
<!--                    	--><?php //if($item->locked){
//						echo img_lock();
//					}else{echo $formBase->checkbox('cid[]',array('value'=>$item->log_id,'onclick'=>"Common.isCheckAll(this)"));}?>
                    </td>

						<td class="tl">
							<div style="text-transform: capitalize;"><span class="label label-<?php echo $aryLogType[$item->type]?>"><?php echo __($aryLogType[$item->type])?></span></div>
						</td>
						<td class="tl">
							<div><?php echo $item->actor?></div>
						</td>
						<td class="tc">
							<div>
								<?php
								if($item->data_before){
									$data_before = json_decode($item->data_before);
									foreach($data_before as $k=>$v){
										echo $v;
										break;
									}
								}else{
									echo '-';
								}
								?>
							</div>
						</td>
						<td class="tl">
                    	<div style="text-transform: capitalize;">
							<?php if($item->controller) echo $item->controller.'/'?>
							<?php if($item->task) echo $item->task.'/'?>
							<?php if($item->comment)echo $item->comment?></div>

                    </td>                    

					<td class="tl">
                    	<div><?php echo formatDate($item->updatedTime)?></div>
                    </td>
					
                    <td class="tc last ">
                    
                    	<div class="settings-button">
                            <?php echo ajax_link('system/log/detail/'.$item->log_id,'<i class="action-icon-eye-open" rel="tooltip" title='.__("LBL_VIEW").'></i>',array('overlay'=>'LBL_VIEW'));?>
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