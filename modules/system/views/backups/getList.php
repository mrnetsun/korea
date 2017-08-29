<?php
 //localTime
 //img_status($item->status,site_url('system/backup/dataSwitch/'.$item->backup_id.'/status'));

$formBase = new FormBase();
echo $formBase->create('system/backup/saveAll');
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
                <td class="tc first w20">
					<?php echo __('LBL_ID'); ?>
				</td>
                                    
					<th class="tl span2">
                    	<div class="sortable <?php echo ($sort_key =='createdId')?$sort_dir:'';?>" onclick="Common.sort(this,'createdId')"><?php echo __("LBL_ACTOR");?></div>
                    </th>                    
					<th class="tl">
					<div><?php echo __("LBL_NOTE");?></div>
                    </th>
				<td class="tl span2">
					<div class="sortable <?php echo ($sort_key =='createdTime')?$sort_dir:'';?>" onclick="Common.sort(this,'createdTime')"><?php echo __("LBL_CREATED");?></div>
				</td>
				<td class="tc last w70">&nbsp;<span class='action-setting'></span></td>
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
				$cur_page = $pagination->cur_page;
				$per_page = $pagination->per_page;
				$numOrderRecord = ($cur_page-1)*$per_page;
            	foreach ($aryData as $item){
						$i++;
						$first = ($i==1)?'LBL_FIRST':'';
						$even = ($i%2==0)?'even':'';
						?>
						<tr class="<?php echo $first.' '.$even;?>">
							<td class="tc first">
								<?php echo $item->backup_id;//($i+$numOrderRecord); ?>
							</td>


							<td class="tl span2">
								<div><?php echo limit_character( $item->firstName.' '.$item->lastName,40 );?></div>
							</td>
							<td class="tl">
								<div><?php echo $item->note; ?></div>
							</td>
							<td class="tl">
								<div><?php echo formatDate( $item->createdTime ); ?></div>
							</td>
							<td class="tc last ">
								<div class="word-wrap">
									<div class="settings-button">
										<div class="toolbar-icons" style="">
											<span onclick="systemController.downloadFile(this)" class="toolbar pointer" href="<?php echo site_url('system/backup/download/'.$item->backup_id); ?>">
												<span><i class="action-icon-download-alt" rel="tooltip" title='<?php echo __("LBL_DOWNLOAD");?>'></i></span>
											</span>
											<?php echo ajax_link('system/backup/edit/'.$item->backup_id,'<i class="icon icon-retweet"></i>',array('overlay'=>'LBL_CONFIRM_RESTORE','confirm'=>true,'title'=>__("LBL_RESTORE"),'tooltip'=>1));?>
										</div>
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