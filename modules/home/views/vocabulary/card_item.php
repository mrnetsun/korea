<div class="row cardItem <?php echo $slideActive;?>" id="cardId_<?php echo $k+1;?>">
<div  class="card ">
    <div class="front">
        <div class="sound">
            <a class="btnSound soundEffect"
                <?php if($word->audio){
                    echo 'data-audio="'.$word->audio.'"';
                }?>
                <?php if($word->slow_audio){
                    echo 'data-slow="'.$word->slow_audio.'"';
                }?>
            ><i class="fa fa-volume-up"></i></a>
            <?php if($LoginData){?>
            <a rel="tooltip" title="Lưu vào danh sách"  data-id="<?php echo  $word->id;?>" class="btnWordFollow"><i class="fa fa-star"></i></a>
            <?php }?>

            <a rel="tooltip" title="(*Hình ảnh minh họa được lấy tự động từ google*)" ><i class="fa fa-question"></i></a>
        </div>
        <div class="wordContent">
            <?php if($word->image){
                echo json_img($word->image);

            }?>

            <h2 class="title">
                <a class="btnSound soundEffect"
                    <?php if($word->audio){
                        echo 'data-audio="'.$word->audio.'"';
                    }?>
                    <?php if($word->slow_audio){
                        echo 'data-slow="'.$word->slow_audio.'"';
                    }?>
                >
                    <?php echo $word->title?>
                </a></h2>
            <h4 class="pronounce">
                <a class="btnSound"

                    <?php
                        echo 'data-audio="'.$word->slow_audio.'" ';

                        echo 'data-slow="'.$word->slow_audio.'" ';
                        ?>
                >
                    <i class="fa fa-bullhorn"></i> <?php echo $word->pronounce?>
                </a>
            </h4>
            <div class="meaning">
                <h1><?php echo $word->meaning?></h1>
            </div>
        </div>

        <div class="footer">
            <i class="fa fa-refresh"></i> Click Lật thẻ
        </div>
    </div>
    <div class="back">
        <div class="sound">
            <a class="btnSound"
                <?php if($word->audio){
                    echo 'data-audio="'.$word->audio.'"';
                }?>
                <?php if($word->slow_audio){
                    echo 'data-slow="'.$word->slow_audio.'"';
                }?>
            ><i class="fa fa-volume-up"></i></a>
            <a><i class="fa fa-star"></i></a>
        </div>
        <div class="wordContent">
            <h2 class="title">
                <a class="btnSound soundEffect"
                    <?php if($word->audio){
                        echo 'data-audio="'.$word->audio.'"';
                    }?>
                    <?php if($word->slow_audio){
                        echo 'data-slow="'.$word->slow_audio.'"';
                    }?>
                >
                    <?php echo $word->title?>
                </a></h2>
            <h4 class="pronounce">
                <a class="btnSound"

                    <?php if($word->slow_audio){
                        echo 'data-audio="'.$word->slow_audio.'"';
                    }else{
                        if($word->audio){
                            echo 'data-audio="'.$word->audio.'"';
                        }
                    }?>
                >
                    <i class="fa fa-bullhorn"></i> <?php echo $word->pronounce?>
                </a>
            </h4>
            <div class="meaning">
                <h1><?php echo $word->meaning?></h1>
            </div>
        </div>
        <div class="footer">
            <i class="fa fa-refresh"></i> Click Lật thẻ
        </div>
    </div>
</div>
</div>