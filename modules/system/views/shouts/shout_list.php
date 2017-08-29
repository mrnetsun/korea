<?php
   if($shouts){
       $i = 1;
        foreach($shouts as $item){
            $i = 1-$i;
        ?>
        <div class="shoutItem row_<?php echo $i?>">
            <div class="left w30">
                <?php
                    $user = json_decode($item->userInfo);
                    echo base_img($user->avatar,array('width'=>30, 'height'=>30))
                ?>
            </div>
            <div class="left">
                <div class="span">
                    <div class="clear"><?php echo $item->message;?></div>
                    <div class="attachment_List">
                        <?php
                        if($item->documents){
                            $attachments = json_decode($item->documents);
                            if(is_array($attachments)){
                                foreach($attachments as $file){
                                    $jfile = json_decode($file);
                                    echo '<a class="file_icon" href="'.ROOT_URL.'/'.$jfile->real_name.'">'.$jfile->client_name.'</a>';
                                }
                            }

                        }
                        ?>
                    </div>
                    <div class="clear note"><span class="bold"><?php echo $user->name;?></span> <?php echo display_time_ago($item->createdTime)?></div>
                </div>

            </div>
            <div class="clear"></div>
        </div>
        <?php
        }
   }else{
       echo "<div class='note'>".__("No message.")."</div>";
   }
?>