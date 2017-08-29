
<div class="span8">
    <div class="questions">
        <div class="head">
            <div class="message warning">
                <div class="searchWrap searchInline">
                    <?php
                    $formBase  = new FormBase();
                    echo $formBase->create('exam/exam/getTestList/',array('id'=>'frmTestFilter','data-not-close-overlay'=>1,'class'=>'form-inline Form','ajax'=>array('Callback'=>'examController.cbFilterTestList')));
                    $question_filter = $this->session->userdata('question_filter');

                    ?>
                    <div>
                        <?php
                        $parentOptions = getTreeOption(0,0,array('table'=>'exam_category','key'=>'exam_category_id','name'=>'cate_name','parent'=>'parent_id'));
                        echo $formBase->hidden('exam_id',array('value'=>$exam_id));
                        echo $formBase->input('title',array('placeholder'=>'LBL_TITLE','class'=>'span2','value'=>$exam_filter['title']));
                        echo $formBase->dropdown('cate_id',array('options'=>$parentOptions,'selected'=>$exam_filter['cate_id'],'empty'=>'LBL_CATEGORY','class'=>'span2'));
                         echo $formBase->submit('BTN_SEARCH',array('label'=>'BTN_SEARCH'));
                        echo $formBase->clear('BTN_CLEAR',array('label'=>'BTN_CLEAR'));
                        ?>
                    </div>
                    <?php echo $formBase->end();?>
                </div></div>
        </div>
        <?php
        $formBase  = new FormBase();
        echo $formBase->create('exam/exam/insertTest/',array('id'=>'frmTestList','class'=>'form-inline Form','ajax'=>array('Callback'=>'examController.cbInsertTest')));

        ?>
        <div id="addTestList" class="addTestList">
            <?php echo  $html;?>
        </div>
        <div class="clear h10"></div>
        <div class="tc">
             <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_ADD_TO_LIST'))?>
            <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
        </div>
        <?php echo $formBase->end();?>
    </div>

</div>
<div class="clear"></div>

