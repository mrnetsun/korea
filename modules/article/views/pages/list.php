<div id="articleList">
    <ul class="booking-list">
<?php
    foreach($articles as $item){
        echo '<li>
                <div class="booking-item">
                                <div class="row">
                                    <div class="col-md-4">
                                       '.json_img($item->thumbnail,'','ban-tin/'.$item->slug).'
                                    </div>
                                    <div class="col-md-8">
                                        <h5 class="booking-item-title">'.anchor('ban-tin/'.$item->slug,$item->title).'</h5>
                                        <ul class="post-meta">
                                        <li><i class="fa fa-calendar"></i><a>'.display_time_ago($item->createdTime).'</a>
                                        </li>
                                         <li><i class="fa fa-user"></i>'.anchor('tac-gia/'.to_slug($item->author),$item->author).'
                                        </li>
                                        </ul>
                                         <p class="booking-item-description">'.$item->short_description.'</p>
                                    </div>
                                </div>
                </div></li>';
    }
?>
</ul>

<?php
//echo $pagination->create_links($start);
echo $pagination->pagination($start);
?>
</div>
