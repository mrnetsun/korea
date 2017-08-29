
<div class="main">
    <div class="shell">
        <div class="grid">
            <h3>Cập nhật category con</h3>
            <ul>
<?php
foreach($categories as $c){
    echo '<li>'.anchor('cronjob/korea/vocabularyCate/'.$c->id,$c->cate_name).'</li>';
}
?></ul>
        </div>
    </div>
</div>
