<div class="gap"></div>
<?php
 echo pageHeader($parent->cate_name);
?>
<div class="row">
    <div class="col-md-12">
        <?php
        echo $pagination->pagination($start);
        ?>
    </div>
</div>
<div class="row">
<?php
$total = count($categories);
$col = ceil($total/3);
echo '<div class="col-md-4">';
for($i = 0; $i< $col; $i++){
    $c = $categories[$i];
    $link = ($c->type == 1)?'tu-vung/topic/'.$c->id:'tu-vung/card/'.$c->id;
    $isDone = ($c->is_done)?'topicDone':'';
    $iconDone = ($c->is_done)?'<i class="fa fa-check-circle"></i>':'';
    echo '<div class="wordTopic '.$isDone.'">'.anchor($link,$iconDone.'<span class="">'.$c->position.'.</span> '.$c->cate_name).'</div>';
}
echo '</div>';

echo '<div class="col-md-4">';
for($i = $col; $i< $col*2; $i++){
    $c = $categories[$i];
    $link = ($c->type == 1)?'tu-vung/topic/'.$c->id:'tu-vung/card/'.$c->id;
    $isDone = ($c->is_done)?'topicDone':'';
    $iconDone = ($c->is_done)?'<i class="fa fa-check-circle"></i>':'';
    echo '<div class="wordTopic '.$isDone.'">'.anchor($link,$iconDone.'<span class="">'.$c->position.'.</span> '.$c->cate_name).'</div>';
}
echo '</div>';

echo '<div class="col-md-4">';
for($i = $col*2; $i< $total; $i++){
    $c = $categories[$i];
    $link = ($c->type == 1)?'tu-vung/topic/'.$c->id:'tu-vung/card/'.$c->id;
    $isDone = ($c->is_done)?'topicDone':'';
    $iconDone = ($c->is_done)?'<i class="fa fa-check-circle"></i>':'';
    echo '<div class="wordTopic '.$isDone.'">'.anchor($link,$iconDone.'<span class="">'.$c->position.'.</span> '.$c->cate_name).'</div>';
}
echo '</div>';
?>

</div>
<div class="row">
    <div class="col-md-12">
        <?php
        echo $pagination->pagination($start);
        ?>
    </div>
</div>