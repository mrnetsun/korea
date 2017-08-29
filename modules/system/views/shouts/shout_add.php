<div id="<?php echo $code?>_shoutbox_wrap" class="shoutbox_wrap">
    <div class="shoutItemForm" id="<?php echo $code?>_shoutbox_user">
        <?php

        $formbase = new FormBase();
        echo $formbase->create('system/shoutbox/insert', array('ajax'=>array('Callback'=>'Common.loadShoutComment'),'class'=>'form-horizontal'));
        echo $formbase->hidden('code',array('value'=>$code));
        ?>

        <table width="100%">
            <tr><td style="width: 40px; padding: 5px 5px 5px 0px;" valign="top">
                    <div style="border: 1px solid #ccc; display: inline-block;">
                        <?php echo base_img($LoginData->avatar,array('width'=>30, 'height'=>30));?>
                    </div>
                </td>
                <td>
                    <?php
                    echo $formbase->textarea('message',array('class'=>'w95p h20','id'=>'message_shoutbox','value'=>'','rule'=>'required'));
                    ?>
                </td>
                <td class="w50">
                    <?php echo $formbase->submit('BTN_SUBMIT',array('label'=>'Shout','class'=>"btn btn-primary")); ?>
                </td>
            </tr>
            <tr><td colspan="3">
                    <?php
                    echo "<div style='margin: 5px; margin-left:50px;;width:285px;'>".__("Attachments: ");
                    //echo "<div style='padding-left: 110px; padding-top: 10px;'>";
                    echo $formbase->upload_document('files',array('class'=>""));
                    echo "</div>";
                    ?>
            </td></tr>
        </table>
    </div>
    <div id="<?php echo $code?>_shoutbox">
        <div style="padding: 10px;"><?php echo img_ajax(); echo __("Loading..."); ?></div>
    </div>
    <div class="clear"></div>
    <script>
        $(document).ready(function(){
           Common.loadShoutComment('<?php echo json_encode(array('ok'=>true,'code'=>$code))?>');
        });
    </script>
</div>