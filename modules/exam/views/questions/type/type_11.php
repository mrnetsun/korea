<?php
//phuc hop
$subQuestion = $this->db->get_where('question',array('parent_id'=>$fillData->question_id,'del_flag'=>0))->result();
?>
<h4>Câu hỏi con <?php echo ajax_link('exam/question/addSub/'.$fillData->question_id,'<i class="icon icon-plus"></i> Thêm',array('class'=>'btn btn-small','overlay'=>'Thêm câu hỏi con'))?></h4>
<table class="tableList">
    <tr>
        <th class="w30">STT</th><th class="w30">#ID</th><th class="w150 tl">Câu hỏi</th><th class="w80">Điểm</th><th class="w80">Điểm trừ</th><th class="w80"></th>
    </tr>
    <?php if($subQuestion){
        foreach($subQuestion as $k=>$q){
            ?>
            <tr><td><?php echo $k+1?></td>
                <td><?php echo $q->question_id?></td>
                <td><?php echo $q->title?></td><td class="tc"><?php echo $q->point?></td><td class="tc"><?php echo $q->point_sub?></td>
            <td>
                <?php echo ajax_link('exam/question/editSub/'.$q->question_id,'<i class="icon icon-edit"></i>',array('class'=>'btn btn-small','overlay'=>'LBL_EDIT'))?>
                <?php echo ajax_link('exam/question/deleteSub/'.$q->question_id,'<i class="icon icon-trash"></i>',array('class'=>'btn btn-small','callBack'=>'questionController.updateQuestionSub'))?>
            </td>
            </tr>
            <?php
        }
    }else{
        ?>
        <tr><td colspan="5"> Không có</td></tr>
        <?php
    }?>
</table>
