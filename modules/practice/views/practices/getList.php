<?php
 //localTime
 //img_status($item->status,site_url('practice/practice/dataSwitch/'.$item->id.'/status'));

$formBase = new FormBase();
echo $formBase->create('practice/practice/saveAll');
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
                                    
					<th class="tl">
                    	<div class="sortable <?php echo ($sort_key =='title')?$sort_dir:'';?>" onclick="Common.sort(this,'title')"><?php echo __("LBL_WORD");?></div>                    	
                    </th>                    
					<th class="tl span2">
                    	<div class="sortable <?php echo ($sort_key =='meaning')?$sort_dir:'';?>" onclick="Common.sort(this,'meaning')"><?php echo __("LBL_MEANING");?></div>                    	
                    </th>                    
					<th class="tl span2">
                    	<div><?php echo __("LBL_PRONOUNCE");?></div>                    	
                    </th>                    
					<th class="tc span1">
                    	<div><?php echo __("LBL_AUDIO");?></div>                    	
                    </th>                    
					<th class="tc span1">
                    	<div class="sortable <?php echo ($sort_key =='status')?$sort_dir:'';?>" onclick="Common.sort(this,'status')"><?php echo __("LBL_STATUS");?></div>                    	
                    </th>                    
					<th class="tc span2">
                    	<div class="sortable <?php echo ($sort_key =='createdTime')?$sort_dir:'';?>" onclick="Common.sort(this,'createdTime')"><?php echo __("LBL_CREATED");?></div>                    	
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
                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->id,'onclick'=>"Common.isCheckAll(this)"));?>
                    </td>
                    
					                    
					<td class="tl">
						<div><h3><?php echo $item->title?></h3></div>
						<div class="note">/<?php echo $item->pronounce?>/</div>
                    	<div class="left thumb">
							<?php if($item->image){
								echo json_img($item->image);
							}?>
						</div>
						<div class="left">

						<div class="note"><?php foreach($item->category as $c){
								echo '<span>'.$c->cate_name.'</span>, ';
							}?></div>
						</div>
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->meaning?></div>                    	
                    </td>                    
					<td class="tl">
                    	<div><?php echo $item->pronounce?></div>                    	
                    </td>                    
					<td class="tc">
                    	<div><?php if($item->audio){
								echo '<a data-audio="'.$item->audio.'" class="btnAudio"><i class="fa fa-volume-up"></i></a>';
							}?></div>
                    </td>                    
					<td class="tc">
                    	<div><?php echo img_status(($item->status)?1:0,site_url('practice/practice/dataSwitch/'.$item->id.'/status'))?></div>
                    </td>                    
					<td class="tc">
                    	<div><?php echo localDate($item->createdTime)?></div>
                    </td>
					
                    <td class="tc last ">
                    
                    	<div class="settings-button">

                    	<div class="toolbar-icons">
                            <?php echo anchor('practice/practice/detail/'.$item->id,'<i class="action-icon-eye-open"></i>',array('overlay'=>'LBL_VIEW'));?>
                            <?php echo anchor('practice/practice/edit/'.$item->id,'<i class="action-icon-edit"></i>',array('overlay'=>'LBL_EDIT'));?>
                            <?php echo ajax_link('practice/practice/delete/'.$item->id,'<i class="action-icon-trash"></i>',array('callBack'=>'reload'));?>
							
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
<script>

	$('.btnAudio').click(function(){
		var url_audio = $(this).data("audio");

		if(url_audio.indexOf('http://')== -1){
			url_audio = ROOT_URL + url_audio
		}
		var obj = $(this);
		obj.addClass('soundOn');

		var mySound = soundManager.createSound({
			url:url_audio ,
			onfinish: function() {
				obj.removeClass('soundOn');
			}
		});
		mySound.play();
	});

</script>
