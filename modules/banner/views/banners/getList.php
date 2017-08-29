<?php
 //localTime
 //img_status($item->status,site_url('banner/banner/dataSwitch/'.$item->banner_id.'/status'));

$formBase = new FormBase();
echo $formBase->create('banner/banner/saveAll');
echo $formBase->loadListUrl();

$bannerType = getSystemDropdownByCode('BANNER_TYPE');
$bannerPosition = getDBDropdown(array('table'=>'banner_position','key'=>'code','val'=>'title'));



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
                   <th class="tc w40">ID</th>
					<th class="tl">
                    	<div><?php echo __("LBL_TITLE");?></div>

                    </th>                    
					<th class="tl span3">
                    	<div><?php echo __("LBL_IMAGE");?></div>                    	
                    </th>                    
					<th class="tl w120">
                    	<div class="sortable <?php echo ($sort_key =='start_date')?$sort_dir:'';?>" onclick="Common.sort(this,'start_date')"><?php echo __("LBL_START_DATE");?></div>                    	
                    </th>                    
					<th class="tl w120">
                    	<div class="sortable <?php echo ($sort_key =='end_date')?$sort_dir:'';?>" onclick="Common.sort(this,'end_date')"><?php echo __("LBL_END_DATE");?></div>                    	
                    </th>                    
					<th class="tl w80">
                    	<div class="sortable <?php echo ($sort_key =='status')?$sort_dir:'';?>" onclick="Common.sort(this,'status')"><?php echo __("LBL_STATUS");?></div>                    	
                    </th>               
                <td class="tc last w80"><span class='action-setting'></span></td>
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
                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->banner_id,'onclick'=>"Common.isCheckAll(this)"));?>
                    </td>
                    <td class="tc"><?php echo $item->banner_id;?></td>
					                    
					<td class="tl">
                    	<div><?php echo $item->title?></div>
						<div class="bold"><?php echo $bannerType[$item->type]?></div>
						<div class="note">
						<?php
							$aryPosition = json_decode($item->position);
							if($aryPosition) {
								foreach ($aryPosition as $p) echo '<span class="label mg5">' . $bannerPosition[$p] . '</span>';
							}
						?>
						</div>
                    </td>
					<td class="tl">
						<div>
								<?php
								switch($item->type){
									case 1:
										echo '<div class="thumb60">'.json_img($item->image).'</div>';
										break;
									case 2:
										echo $item->googleads;
										break;
									case 3:
										echo htmlspecialchars($item->googleads);
										break;
								}
								?>

						</div>
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->start_date?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->end_date?></div>                    	
                    </td>                    
					<td class="tc">
                    	<div><?php echo img_status($item->status,site_url('banner/banner/dataSwitch/'.$item->banner_id.'/status'))?></div>
                    </td>
					
                    <td class="tc last ">
                    
                    	<div class="settings-button">

                    	<div class="toolbar-icons">
                            <?php echo ajax_link('banner/banner/detail/'.$item->banner_id,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                            <?php echo anchor('banner/banner/edit/'.$item->banner_id,'<i class="action-icon-edit"></i>',array('overlay'=>'LBL_EDIT'));?>
                            <?php echo ajax_link('banner/banner/delete/'.$item->banner_id,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>
							
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