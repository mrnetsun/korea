<div class="gap"></div>
<div class="container">
    <div>
<?php
    $formBase = new  FormBase();


    echo pageHeader('LBL_TITLE_PROFILE');
?>
</div></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <?php $this->load->view('account/aside',array('user'=>$user,'active_menu'=>'account/profile'));?>
        </div>
        <div class="col-md-9 pageDetail">
            <h4><?php echo __("LBL_STATISTIC")?></h4>
            <ul class="list list-inline user-profile-statictics mb30">
                <li><i class="fa fa-history user-profile-statictics-icon"></i>
                    <h5>
                        <?php
                        $dStart = new DateTime($user->createdTime);
                        $dEnd  = new DateTime('now');
                        $dDiff = $dStart->diff($dEnd);
                        echo $dDiff->format('%R');
                        echo $dDiff->days;
                        ?>
                    </h5>
                    <p><?php echo __("LBL_DATE")?></p>
                </li>
                <li><i class="fa fa-globe user-profile-statictics-icon"></i>
                    <h5><?php echo intval($totalSearch);?></h5>
                    <p><?php echo __("LBL_STATISTIC_SEARCH")?></p>
                </li>
                <li><i class="fa fa-building-o user-profile-statictics-icon"></i>
                    <h5><?php echo anchor('home/business',intval($totalCompany));?></h5>
                    <p><?php echo __("LBL_COMPANY")?></p>
                </li>
                <li><i class="fa fa-bullhorn user-profile-statictics-icon"></i>
                    <h5><?php echo intval($totalBanner);?></h5>
                    <p><?php echo __("LBL_ADVERTISING")?></p>
                </li>
                <li><i class="fa fa-bookmark user-profile-statictics-icon"></i>
                    <h5><?php echo intval($totalFollowed);?></h5>
                    <p><?php echo __("LBL_COMPANY_SAVED")?></p>
                </li>
            </ul>

        </div>
    </div>
</div>
<div class="gap"></div>