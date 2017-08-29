<?php

$formBase = new FormBase();
echo $formBase->create('system/config/saveAll');
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
                                    
					<th class="tl span2">
                    	<div class="sortable <?php echo ($sort_key =='configName')?$sort_dir:'';?>" onclick="Common.sort(this,'configName')"><?php echo __("Name");?></div>                    	
                    </th>                    
					<th class="tl span3">
                    	<div class="sortable <?php echo ($sort_key =='configCode')?$sort_dir:'';?>" onclick="Common.sort(this,'configCode')"><?php echo __("Code");?></div>                    	
                    </th>                    
					<th class="tl">
                    	<div><?php echo __("Value");?></div>                    	
                    </th>               
                <td class="tc last w50"><span class='action-setting'></span></td>
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
                    <?php if($item->locked){
                        echo img_lock();
                    }else {
                        echo $formBase->checkbox('cid[]', array('value' => $item->configId, 'onclick' => "Common.isCheckAll(this)"));
                    }?>
                    </td>
                    
					                    
					<td class="tl">
                    	<div><?php echo $item->configName?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->configCode?></div>
                        <div class="note"><?php echo $item->description?></div>
                    </td>                    
					<td class="tl">
                    	<div><?php
                            switch($item->type){
                                case 'json':
                                    echo ajax_link('system/config/viewConfig/'.$item->configId,__('LBL_VIEW'),array('overlay'=>__('Detail')));
                                    break;
                                case 'upload_image':
                                    $value = json_decode($item->configValue);
                                    //debug($value);
                                    echo '<a class="group_'.$item->configId.'" href="'.ROOT_URL.$value->real_name.'">';
                                    echo json_img($item->configValue,array('width'=>'40','height'=>'40','style'=>'width:100px; height:auto;'));
                                    echo '</a>';
                                    echo '<script>
                                        $(document).ready(
                                            function(){$(".group'.$item->configId.'").colorbox({rel:"group_'.$item->configId.'"});
                                        });
                                    </script>';
                                    break;
                                case 'yesno':
                                    echo ($item->configValue)? __("Yes"):__("No");
                                    break;
                                case 'status':
                                    echo ($item->configValue)? __("Active"):__("Deactive");
                                    break;
                                default:
                                    echo $item->configValue;
                                    break;
                            }

                            ?></div>
                    </td>
					
                    <td class="tc last ">
                    
                    	<div class="settings-button">

                    		<div class="toolbar-icons" style="">
                            <?php //echo ajax_link('system/config/detail/'.$item->configId,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                            <?php if($item->locked){
                                echo img_lock();
                            }else { ?>
                                <?php
                                if (checkPermissionUser(array('task' => 'edit'), $LoginData->permission)):
                                    echo ajax_link('system/config/edit/' . $item->configId, '<i class="action-icon-edit"></i>', array('overlay' => 'LBL_EDIT'));
                                endif;
                            }?>

                            <?php //echo ajax_link('system/config/delete/'.$item->configId,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>
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



