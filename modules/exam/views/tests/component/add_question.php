
<div class="span8">
    <div class="questions">
        <div class="head">
            <div class="message warning">
                <div class="searchWrap searchInline">
            <?php
                $formBase  = new FormBase();
                echo $formBase->create('exam/test/getQuestionList/',array('id'=>'frmQuestionFilter','data-not-close-overlay'=>1,'class'=>'form-inline Form','ajax'=>array('Callback'=>'testController.cbFilterQuestionList')));
                    $question_filter = $this->session->userdata('question_filter');

            ?>
                <div>
                   <?php
                   $parentOptions = getTreeOption(0,0,array('table'=>'question_category','key'=>'cate_id','name'=>'cate_name','parent'=>'parent_id'));
                   echo $formBase->hidden('test_id',array('value'=>$test_id));
                   echo $formBase->hidden('component_id',array('value'=>$component_id));
                   echo $formBase->input('question',array('placeholder'=>'LBL_NAME','class'=>'span2','value'=>$question_filter['question']));
                   echo $formBase->dropdown('cate_id',array('options'=>$parentOptions,'selected'=>$question_filter['cate_id'],'empty'=>'LBL_CATEGORY','class'=>'span2'));
                   echo $formBase->dropdown('question_type',array('placeholder'=>'LBL_NAME','options'=>getSystemDropdownByCode('QUESTION_TYPE'),'selected'=>$question_filter['question_type'],'empty'=>'LBL_QUESTION_TYPE','class'=>'span2'));
                   echo $formBase->submit('BTN_SEARCH',array('label'=>'BTN_SEARCH'));
                   echo $formBase->clear('BTN_CLEAR',array('label'=>'BTN_CLEAR'));
                   ?>
                </div>
            <?php echo $formBase->end();?>
          </div></div>
        </div>
        <?php
        $formBase  = new FormBase();
        echo $formBase->create('exam/test/insertTestQuestion/',array('id'=>'frmQuestionList','class'=>'form-inline Form','ajax'=>array('Callback'=>'testController.cbInsertTestQuestion')));
        echo $formBase->hidden('test_id',array('value'=>$test_id));
        echo $formBase->hidden('component_id',array('value'=>$component_id));
        ?>
        <div id="addQuestionsList" class="addQuestionsList">
            <?php echo  $html;?>
        </div>
        <div class="clear h10"></div>
        <div class="tc">
            <?php echo __("LBL_ADD_RANDOM")?> <?php echo $formBase->input('number_random',array('placeholder'=>'LBL_INPUT','class'=>'w70','rules'=>'numeric','onkeyup'=>'testController.clearCheck(this)'))?> <?php echo __("LBL_QUESTION")?>.
           <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_ADD_TO_LIST'))?>
           <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
        </div>
        <?php echo $formBase->end();?>
    </div>

 </div>
 <div class="clear"></div>

