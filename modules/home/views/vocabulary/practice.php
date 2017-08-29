<h1 class="practiceWord"><span class="word soundEffect"> <?php echo $word->title?></span> <a class="btnSound soundEffect" data-audio="<?php echo $word->audio?>"><i class="fa fa-volume-up"></i></a>
    <div class="pronounce" style="height: 1.2em;line-height: 1.2em;position: relative;" ><span style="display: none;">/<?php echo $word->pronounce;?>/</span></div>
    <div class="hintWrap">
        <a href="#" data-toggle="tooltip" data-html="true" title='<?php echo json_img($word->image)?>'><i class="fa fa-lightbulb-o"></i></a>
    </div>
</h1>
<div class="gap-mini"></div>
<div class="questionPracticeItem">
        <input type="hidden" name="cate_id" value="<?php echo $cate_id;?>"/>
        <input type="hidden" name="q" value="<?php echo $word->id?>"/>
        <input type="hidden" name="index" value="<?php echo $index;?>"/>
        <?php
            $means[] = $word ;
            foreach($mixed as $w){
                $means[] = $w;
            }

        shuffle($means);

        foreach($means as $k=>$v){
            ?>
                <div class="answerWrap" id="k_<?php echo md5('index'.$v->id)?>">
                    <label><span class="control"> <input type="radio" name="answer" value="<?php echo md5('index'.$v->id)?>"/></span> <a class="option"><?php echo ($k+1);?></a> <?php echo $v->meaning;?></label>
                </div>
            <?php
        }

        ?>

</div>

<script>
    var oAjax = null;
    $(document).ready(function(){
        $('.btnSound').click(function(){
            homeController.playSound(this);
        });

        setTimeout(function(){ homeController.playSound($('.btnSound')); }, 2000);

        $('.questionPracticeItem input').click(function(){
            $('#dang_cham').show();
            $('.questionPracticeItem .checked').removeClass('checked true false');
            $(this).closest('label').find('.option').addClass('checked');
            if(oAjax) oAjax.abort();
            oAjax =  $.ajax({
                url: '<?php echo site_url("tu-vung/check")?>',
                type: "POST",
                data: $('.questionPracticeItem input').serialize(),
                dataType:'json',
                success:function(data){
                    $('#dang_cham').hide();
                    if(data.ok){

                        $('#k_'+data.answer).find('.option').addClass('true');
                        $('#answer_true').show();
                        $('#answer_false').hide();

                        //update process
                        $('#progress_id .progress-bar').width(data.percent + '%');
                        $('#progress_id .progress-bar').text(data.label);


                    }else {
                        $('#k_'+data.answer).find('.option').addClass('false');
                        $('#answer_true').hide();
                        $('#answer_false').show();
                    }

                    setTimeout(function(){
                        $('#questionDetail').html(data.html);
                        $('#answer_true').hide();
                        $('#answer_false').hide();
                    },2000);
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('a[data-toggle=tooltip]').tooltip();
    });
</script>