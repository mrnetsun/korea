
<div class="main">
    <div class="shell">
        <div class="span5">
            <h3>Cập nhật từ vựng vào danh mục</h3>
            <ul>
<?php
foreach($categories as $c){
    echo '<li id="item_'.$c->id.'"><span class="label">'.$c->id.'</span> '.ajax_link('cronjob/korea/vocabularyById/'.$c->id,$c->cate_name,array('callBack'=>'cbGetData')).'</li>';
}
?></ul>
        </div>
        <div class="span5" id="result"></div>
    </div>
</div>

<script>
    function cbGetData(data){
        var  data = $.parseJSON(data);

         $('#item_'+(parseInt(data.id) +1)).find('a').trigger("click");

        $('#item_'+data.id).remove();


        $('#result').append(data.html);
    }
</script>