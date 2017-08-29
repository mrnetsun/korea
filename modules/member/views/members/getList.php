<?php 
$formBase = new FormBase();
echo $formBase->create('member/saveAll');
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
                <td class="tl"><div class="sortable <?php echo ($sort_key =='lastName')?$sort_dir:'';?>" onclick="Common.sort(this,'lastName')"><?php echo __('LBL_NAME')?></div></td>
                <th class="tl w120"><div class="sortable <?php echo ($sort_key =='clientId')?$sort_dir:'';?>" onclick="Common.sort(this,'clientId')"><?php echo __('LBL_PARTNER')?></div></th>
                <th class="tl w120"><div class="sortable <?php echo ($sort_key =='username')?$sort_dir:'';?>" onclick="Common.sort(this,'username')"><?php echo __('LBL_USERNAME')?></div></th>
                <td class="tl w150"><div class="sortable <?php echo ($sort_key =='expired')?$sort_dir:'';?>" onclick="Common.sort(this,'expired')"><?php echo __('LBL_EXPIRED')?></div></td>
                <td class="tc w70"><div class="sortable <?php echo ($sort_key =='status')?$sort_dir:'';?>" onclick="Common.sort(this,'status')"><?php echo __('LBL_STATUS')?></div></td>
                <td class="tc span2"><div class="sortable <?php echo ($sort_key =='createdTime')?$sort_dir:'';?>" onclick="Common.sort(this,'createdTime')"><?php echo __('LBL_CREATED_DATE')?></div></td>
                <td class="tc last w90">&nbsp;<span class='action-setting'></span></td>
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
                    //debug($item);
            		$i++;
            		$first = ($i==1)?'LBL_FIRST':'';
            		$even = ($i%2==0)?'even':'';
            		?>
            		<tr class="<?php echo $first.' '.$even;?>">
                    <td class="tc first">
                    	<?php if($item->locked_myself || $item->locked){
                            echo img_lock();
                        }else{echo $formBase->checkbox('cid[]',array('value'=>$item->memberId,'onclick'=>"Common.isCheckAll(this)"));}?>
                    </td>
                    <td class="">
                    <div class="memberAvatar pointer" onclick="Common.linkSetup(this,{ajax:true,overlay:true,title:'Profile'})" data-url="<?php echo site_url('member/edit/'.$item->memberId)?>">
                    <?php 
                    	echo base_img($item->avatar,array('width'=>50, 'height'=>50,'class'=>'w30 h30'));
                    ?>
                    </div>
                    <div class="memberInfo">
						<div class="w200 word-wrap">
                            <strong>
                                <?php echo limit_character( $item->firstName.' '.$item->lastName, 15,'...' ) ?>
                            </strong>
                        </div>
                        <div class="note"><?php echo $item->email;?></div>
                        <?php echo __("LBL_ROLE")?>: <strong><?php if($item->aryRoleName) echo implode(', ',$item->aryRoleName); else echo __("None");?></strong></div>
                        
                    </div>
                    </td>
                    <td>
                        <?php echo $item->client_name;?>
                    </td>
                    <td>
                        <div class="word-wrap" style="max-width: 400px">
                            <?php echo limit_character( $item->username , 35,'...' ); ?>
                        </div>
                    </td>
                    <td class="word-wrap"style="max-width: 300px;">
                        <div class="<?php echo (strtotime($item->expired)<time())? 'text_error':'';?>">
                        <?php echo formatDate($item->expired);?>
                        </div>
                    </td>
                    <td class="tc"><?php if($item->locked){
                            echo img_lock();
                        }else{echo img_status($item->status,site_url('member/dataSwitch/'.$item->memberId.'/status'));}?></td>
                    <td class="tc"><?php echo formatDate($item->createdTime);?></td>
                    <td class="tc last ">
                    
                    	<div class="settings-button">
                    		<div class="toolbar-icons">
							    <?php echo ajax_link('member/detail/'.$item->memberId,'<i class="action-icon-eye-open" rel="tooltip" title='.__("LBL_VIEW").'></i>',array('overlay'=>'LBL_VIEW'));?>
                                <?php if($item->locked){
                                    echo img_lock();
                                }else{?>
                                <?php
                                if(checkPermissionUser(array('task' => 'edit'), $LoginData->permission)):
                                echo ajax_link('member/edit/'.$item->memberId,'<i class="action-icon-edit"  rel="tooltip" title='.__("LBL_EDIT").'></i>',array('overlay'=>'LBL_EDIT'));
                                endif;
                                ?>
                                <?php
                                if(checkPermissionUser(array('task' => 'delete'), $LoginData->permission)):if($item->locked_myself ){
                                    echo img_lock();
                                }else{
                                   echo ajax_link('member/delete/'.$item->memberId,'<i class="action-icon-trash" rel="tooltip" title='.__("LBL_DELETE").'></i>',array('callBack'=>'reload'));
                                }
                                endif;?>
                                <?php }?>
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
				
//				$(".settings-button").mouseenter(function()
//				{
//				    $(this).find('.toolbar-icons').fadeIn('fast');
//
//				    $(this).mouseleave(function()
//					{
//					    $(this).find('.toolbar-icons').fadeOut('fast');
//					});
//
//				    $(this).click(function()
//					{
//				    	$(this).find('.toolbar-icons').hide();
//					});
//				});

				

			});
</script>