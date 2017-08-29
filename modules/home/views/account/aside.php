<?php $formBase = new FormBase();

$aryMenu = array(
    'account/profile' =>array('icon'=>'fa-user','name'=>'LBL_MY_OVERVIEW'),
    'account/setting' =>array('icon'=>'fa-cog','name'=>'LBL_MY_PROFILE'),
     'account/history' =>array('icon'=>'fa-clock-o','name'=>'LBL_MY_HISTORY'),
);

?>
<aside class="user-profile-sidebar">
    <div class="user-profile-avatar text-center">
        <div id="imagePreview">
            <?php echo base_img($user->avatar,array('class'=>'origin round'),ROOT_URL.DEFAULT_AVATAR)?>
        </div>
        <div> <?php echo $formBase->upload_image('avatar',array('url'=>site_url("member/profile/avartaUpload"),'data'=>array('dir'=>MEMBER_AVATAR,'crop'=>1,'width'=>100, 'height'=>100,'pre_name'=>'avarta_'),'preview'=>'imagePreview','rules'=>"",'accept'=>"image/jpeg,image/gif,image/png",'class'=>'btn updateAvatarButton')); ?></div>
        <h5><?php echo $user->firstName.' '.$user->lastName;?></h5>
        <p><?php echo localDate($user->createdTime)?></p>
    </div>
    <ul class="list user-profile-nav">
        <?php foreach($aryMenu as $k=>$item){
            $class = ($k == $active_menu)?"class=\"active\"":"";
            ?>
        <li <?php echo $class;?>><a href="<?php echo site_url($k)?>"><i class="fa <?php echo $item['icon']?>"></i><?php echo __($item['name'])?></a>
        </li>
         <?php }?>
    </ul>
</aside>