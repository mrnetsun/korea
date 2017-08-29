<div class="gap-minis"></div>
<div class="row">
    <div class="col-md-12" style="padding: 10px;">
        <a class="btn btn-primary" href="<?php echo site_url('tu-vung/card/'.$category->id)?>"><i class="fa fa-book"></i> Học từ</a>
        <a class="btn btn-default" href="<?php echo site_url('tu-vung/luyentap/'.$category->id)?>"><i class="fa fa-flag"></i> Luyện tập</a>
        <a class="btn <?php if($topic_done){ echo "btn-success"; }else{ echo "btn-default";}?>" href="<?php echo site_url('tu-vung/kiemtra/'.$category->id)?>"><i class="fa fa-check-square-o"></i> Kiểm tra</a>
    </div>

</div>

<div class="gap-mini"></div>
<h3>Chủ đề: <?php echo $category->cate_name?></h3>
<?php

if($topic_done){?>
<div class="row topic_done">
    <div class="col-md-12" style="padding:0px 10px 10px 10px;">
        <i class="fa fa-check-circle"></i> Bạn đã hoàn thành ngày <?php echo date("m/d/Y H:i",strtotime($topic_done['date']))?>
    </div>
</div>
<?php }?>
<div class="row">
    <div class="col-md-6">
        <div>
    <?php
    //echo pageHeader($category->cate_name .'('.count($words).' từ)',array('tag'=>'h4'));
    //debug($words[0],false);
    //$word = $words[0];
    foreach($words as $k=>$word){
        $slideActive = ($k==0)?'slideActive':'';
        $this->load->view('vocabulary/card_item.php',array('word'=>$word,'slideActive'=>$slideActive,'k'=>$k));
    }
    ?>
    </div>
<div class="row">
    <div class="cardController col-md-12" data-current="1" data-total="<?php echo intval(count($words))?>" >

        <div class="row" style="margin: auto; max-width: 470px; margin-top: 10px;">
            <table style="margin: auto;">
                <tr>
                    <td><a id="btnPrev" class="btn btn-default"><i class="fa fa-caret-left"></i></a></td>
                    <td>
                        <div class="cardProcessBar">
                        <div style="text-align: center"><span id="totalProcess">1</span>/<?php echo count($words);?></div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="0"
                                 aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                <span class="sr-only"></span>
                            </div>
                        </div>
                        </div>
                    </td>
                    <td><a id="btnNext" class="btn btn-default"><i class="fa fa-caret-right"></i></a></td>
                </tr>
            </table>
        </div>
    </div>
    </div>
</div>
<div class="col-md-6">
    <div class="control-group audioSetting">
        <label class="control-label"><b>Phát âm</b></label>
        <div class="control"><label><input type="radio" name="audio" value="1" checked="checked"> Bình thường</label></div>
        <div class="control"><label><input type="radio" name="audio" value="2"> Nghe chậm</label></div>
        <div class="control"><label><input type="radio" name="audio" value="0"> Tắt</label></div>

    </div>
    <div class="gap-mini"></div>
    <div class="control-group displaySetting">
        <label class="control-label"><b>Hiển thị</b></label>
        <div class="control"><label><input type="radio" name="display" value="1" checked="checked"> Tiếng Hàn</label></div>
        <div class="control"><label><input type="radio" name="display" value="2"> Tiếng Việt</label></div>
        <div class="control"><label><input type="radio" name="display" value="3"> Cả hai</label></div>
    </div>
    <div class="gap-mini"></div>
    <div class="control-group">
        <a id="btnPlayRandom" class="btn btn-default pointer"><i class="fa fa-random"></i></a>
        <a id="btnPlay" class="btn btn-default pointer"><i class="fa fa-play"></i></a>
    </div>
    <div class="gap-mini"></div>
</div>
</div>
<script type="text/javascript">
    var current = 1;

    var autoPlay ='';
    var randomPlay = '';

    $(function(){

        homeController.changeCardDisplaySetting();

        $('.displaySetting input').click(function(){
            homeController.changeCardDisplaySetting();
        })


        $(".card").flip({
            axis: "y",
            reverse: true,
            trigger: "click"
        });

        $(".card").on('flip:done',function(){
            var flip = $(this).data("flip-model");

            if(flip.isFlipped){
                //meaning
                homeController.playCardSound(this);
            }else{
                //title
                //homeController.playCardSound(this,0);
            }
        });

        $('.btnSound').click(function(){
            homeController.playObjectSound(this);
        });

        $('#btnPrev').click(function(){
            $('.slideActive').removeClass('slideActive');

            if(autoPlay)clearInterval(autoPlay);
            if(randomPlay)clearInterval(randomPlay);
            $('#btnPlay').removeClass('btn-primary');
            $('#btnPlay i').removeClass('fa-pause').addClass('fa-play');

            $('#btnPlayRandom').removeClass('btn-primary');

            var total =  parseInt($('.cardController').data('total'),10);
            current --;

            if(current < 1){ current = total; }

            $('#cardId_'+current).addClass('slideActive');

            homeController.playCardSound('#cardId_'+current);

            updateProcess();

        });

        $('#btnNext').click(function(){
            $('.slideActive').removeClass('slideActive');

            if(autoPlay)clearInterval(autoPlay);
            if(randomPlay)clearInterval(randomPlay);
            $('#btnPlay').removeClass('btn-primary');
            $('#btnPlay i').removeClass('fa-pause').addClass('fa-play');

            $('#btnPlayRandom').removeClass('btn-primary');

            var total = parseInt($('.cardController').data('total'),10);
            current = current + 1;

//            alert(index); alert(total);
            if(current > total){ current = 1; }

            $('#cardId_'+current).addClass('slideActive');

            homeController.playCardSound('#cardId_'+current);

            updateProcess();

        });

        $('#btnPlayRandom').click(function(){

            if($(this).hasClass('btn-primary')){
                clearInterval(randomPlay);
                $(this).removeClass('btn-primary');
                return;
            }

            $('#btnPlay').removeClass('btn-primary');
            $('#btnPlay i').removeClass('fa-pause').addClass('fa-play');
            $(this).addClass('btn-primary');
            clearInterval(autoPlay);
            randomPlay = setInterval(cardPlayRandom, 5000);
            //$('#btnNext').trigger('click');
        });

        $('#btnPlay').click(function(){

            if($(this).hasClass('btn-primary')){
                clearInterval(autoPlay);
                $(this).removeClass('btn-primary');
                $('#btnPlay i').removeClass('fa-pause').addClass('fa-play');
                return;
            }

            $('#btnPlayRandom').removeClass('btn-primary');
            $('#btnPlay i').removeClass('fa-play').addClass('fa-pause');
            $(this).addClass('btn-primary');
            clearInterval(randomPlay);
            autoPlay = setInterval(cardAutoPlay, 5000);
            //$('#btnNext').trigger('click');
        });

        $('.btnWordFollow').click(function(){
            if($(this).hasClass('followOn')){
                flag = 0;
            }else{
                flag = 1;
            }
            $(this).toggleClass('followOn');
            $(this).closest('.card').toggleClass('cardFollow');
        })


        function updateProcess(){
            var total = parseInt($('.cardController').data('total'),10);
            var p = current/total * 100;
            $('.progress-bar').width(p+'%');
            $('#totalProcess').html(current.toString());
        }


        function cardPlayRandom(){
            $('.slideActive').removeClass('slideActive');

            var total = parseInt($('.cardController').data('total'),10);
            var i =  Math.floor(Math.random() * (total-1)) + 1;
            current = i;
            $('#cardId_'+current).addClass('slideActive');
            homeController.playCardSound('#cardId_'+current);
            updateProcess();
        }

        function cardAutoPlay(){
            $('.slideActive').removeClass('slideActive');

            var total = parseInt($('.cardController').data('total'),10);
            current ++;
            if(current > total){
                current = 1;
               // clearInterval(autoPlay);
               // $(this).removeClass('btn-primary');
               // return;
            };
            $('#cardId_'+current).addClass('slideActive');
            homeController.playCardSound('#cardId_'+current);
            updateProcess();
        }



    });

</script>
