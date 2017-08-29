<div class="optionsWrap">
<?php
//lua chon 1 dap an
$answer = json_decode($fillData->answer);
//debug($anwser,false);
    if(!$answer) {
        $stand = new stdClass();
        $stand->plan_a = "";
        $stand->true_plan = "";
        $answer = array(0=> $stand,1=>$stand);
    }
    foreach ($answer as $k => $a) {
        $checked = ($a->true_plan) ? $k : '';
        echo '<div class="item">';
        echo '<span class="answerCircle">' . ($k + 1) . '</span>';
        echo $formBase->input('answer[' . $k . '][plan_a]', array('value' => $a->plan_a, 'class' => 'span4'));
        echo $formBase->radio('true_plan', array('value' => $k, 'checked' => $checked));
        if ($k > 1) {
            echo '<i class="icon icon-trash pointer" onclick="removeItem(this)"></i>';
        }
        echo '</div>';
    }

?>
</div>
<a class="btn btn-small" style="margin: 20px;" onclick="addItem();"><i class="icon icon-plus"></i> Thêm</a>

<script>
    function addItem(){
        var html='<div class="item"><span class="answerCircle"></span><?php echo $formBase->input('answer['.$k.'][plan_a]',array('value'=>'','class'=>'span4')); echo $formBase->radio('true_plan',array('value'=>-1));?><i class="icon icon-trash pointer" onclick="removeItem(this)"></i></div>';
        $('.optionsWrap').append(html);
        updateLabel();
    }

    function updateLabel(){
        $('.optionsWrap .answerCircle').each(function(index){
            $(this).html(index+1);
        });

        $('.optionsWrap input[type=radio]').each(function(index){
            $(this).val(index);
        });

        $('.optionsWrap input[type=text]').each(function(index){
            $(this).attr('name','data[question][answer]['+index+'][plan_a]');
        });

    }

    function  removeItem(obj){
        $(obj).closest('.item').remove();
        updateLabel();
    }
</script>
