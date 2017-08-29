<?php
 //localTime
 //img_status($item->status,site_url('company/category/dataSwitch/'.$item->cateId.'/status'));

$formBase = new FormBase();
echo $formBase->create('company/category/saveAll');
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
                 <th class="tc w20">
					 <div class="sortable <?php echo ($sort_key =='cateId')?$sort_dir:'';?>" onclick="Common.sort(this,'cateId')"><?php echo __("LBL_ID");?></div>
				 </th>
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='name')?$sort_dir:'';?>" onclick="Common.sort(this,'name')"><?php echo __("LBL_TITLE");?></div>                    	
                    </th>
				<th class="tl span3">
					<div class="sortable <?php echo ($sort_key =='parentId')?$sort_dir:'';?>" onclick="Common.sort(this,'parentId')"><?php echo __("LBL_PARENT");?></div>
				</th>

				<th class="tc w100">
                    	<div class="sortable <?php echo ($sort_key =='status')?$sort_dir:'';?>" onclick="Common.sort(this,'status')"><?php echo __("LBL_STATUS");?></div>                    	
                    </th>
				<th class="tc span2">
					<div class="sortable <?php echo ($sort_key =='updatedTime')?$sort_dir:'';?>" onclick="Common.sort(this,'updatedTime')"><?php echo __("LBL_UPDATED");?></div>
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
                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->cateId,'onclick'=>"Common.isCheckAll(this)"));?>
                    </td>
						<td class="tc">
							<div><?php echo $item->cateId?></div>
						</td>

						<td class="tl">
                    	<div><?php echo $item->name?></div>                    	
                    </td>                    

					<td class="tl">
                    	<div><?php echo ($item->parent_name)?$item->parent_name:__("LBL_ROOT")?></div>
                    </td>
						<td class="tc">
							<div><?php echo img_status($item->status,site_url('company/category/dataSwitch/'.$item->cateId.'/status'))?></div>
						</td>
						<td class="tc">
							<div><?php echo localDate($item->updatedTime)?></div>
						</td>

						<td class="tc last ">
                    
                    	<div class="settings-button">

                    	<div class="toolbar-icons" >
                            <?php echo ajax_link('company/category/detail/'.$item->cateId,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                            <?php echo ajax_link('company/category/edit/'.$item->cateId,'<i class="action-icon-edit"></i>',array('overlay'=>'LBL_EDIT'));?>
                            <?php echo ajax_link('company/category/delete/'.$item->cateId,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>
							
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

