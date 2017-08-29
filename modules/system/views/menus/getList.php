<?php 
$formBase = new FormBase();
echo $formBase->create('system/menu/saveAll');
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
                	<div class="sortable <?php echo ($sort_key =='menuId')?$sort_dir:'';?>" onclick="Common.sort(this,'menuId')"><?php echo __('#ID')?></div>
                	</th>                
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='moduleId')?$sort_dir:'';?>" onclick="Common.sort(this,'moduleId')"><?php echo __("Module");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='menuName')?$sort_dir:'';?>" onclick="Common.sort(this,'menuName')"><?php echo __("Name");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div><?php echo __("Link");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='parentId')?$sort_dir:'';?>" onclick="Common.sort(this,'parentId')"><?php echo __("Parent");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='menuType')?$sort_dir:'';?>" onclick="Common.sort(this,'menuType')"><?php echo __("Type");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div><?php echo __("LBL_STATUS");?></div>
                    </th>                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='createdId')?$sort_dir:'';?>" onclick="Common.sort(this,'createdId')"><?php echo __("Created");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='position')?$sort_dir:'';?>" onclick="Common.sort(this,'position')"><?php echo __("Position");?></div>                    	
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
                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->menuId,'onclick'=>"Common.isCheckAll(this)"));?>
                    </td>
                    
					<td class="tc">
                    	<div><?php echo $item->menuId?></div>                    	
                    </td>                   
					<td class="tl">
                    	<div><?php echo $item->moduleId?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->menuName?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->menuLink?></div>                    	
                    </td>                     
					<td class="tl">
                    	<div><?php echo $item->parentId?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->menuType?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo img_status($item->status,site_url('system/menu/dataSwitch/'.$item->menuId.'/status'))?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->createdName?></div>
                    	<div class="note"><?php echo localDate($item->createdTime)?></div>                     	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->position?></div>                    	
                    </td>
					
                    <td class="tc last ">
                    
                    	<div class="settings-button">

							<?php echo ajax_link('system/menu/detail/'.$item->menuId,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                            <?php echo ajax_link('system/menu/edit/'.$item->menuId,'<i class="action-icon-edit"></i>',array('overlay'=>'LBL_EDIT'));?>
                            <?php echo ajax_link('system/menu/delete/'.$item->menuId,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>								
							

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