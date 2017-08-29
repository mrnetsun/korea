<div class="gap"></div>
<div class="container">
    <div>
        <?php
        $message = $this->session->flashdata('message');
        if($message){
            echo '<script> $(document).ready(function(){ Common.dialogAlert("'.$message.'");}); </script>';
        }


        $formBase = new  FormBase();
        echo pageHeader('LBL_TITLE_PROFILE');
        ?>
    </div></div>
<div class="container ">
    <div class="row">
        <div class="col-md-3">
            <?php $this->load->view('account/aside',array('user'=>$user,'active_menu'=>'home/business'));?>
        </div>
        <div class="col-md-9 pageDetail">
            <h4><?php echo __("LBL_MY_COMPANY")?></h4>
            <div id="companyList">
                <?php foreach ($company as $k=>$com){?>
                <div class="row row_<?php echo $k%2;?>">
                    <div class="col-md-2">
                        <div class="logoBox">
                            <div class="company_logo_list">
                        <?php
                        if($com->Company_Logo) {
                            $logoJson = json_decode($com->Company_Logo);

                            if ($logoJson) {
                                echo base_img($logoJson->real_name);
                            } else {
                                echo base_img($com->Company_Logo);
                            }
                        }
                        ?>
                    </div></div></div>
                    <div class="col-md-8">
                        <h5><?php echo $com->Company_Name;?></h5>
                        <div><?php echo  truncate(strip_tags($com->Company_Profile),100)?></div>
                    </div>
                    <div class="col-md-2">
                        <?php echo anchor('home/business/edit/'.$com->id,'<i class="fa fa-edit"></i> '.__("LBL_EDIT"),array('class'=>'btn btn-success'))?>
                    </div>
                </div>
                <?php }?>
            </div>

        </div>
    </div>
</div>
<div class="gap"></div>