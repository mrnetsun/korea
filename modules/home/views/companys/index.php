<div class="gap"></div>
<div class="container pageDetail">
<div class="row">
    <div class="col-md-8">
        <div class="row">
            <header class="booking-item-header">
                <div class="">
                    <div class="col-md-9">

                        <h1 class="lh1em company_name"><?php echo $company->Company_Name;?></h1>
                        <p class="lh1em"><i class="fa fa-map-marker"></i> <?php echo $company->Contact->Address;?></p>
                        <div class="grap"></div>
                        <div> <div class="starWrap"><?php
                                echo page_star($company->Rate->Value,$company->Rate->Total)?></div>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="logoBox">
                            <div class="company_logo inline">
                                <?php
                                if($company->Company_Logo){
                                    $logoJson = json_decode($company->Company_Logo);

                                    if($logoJson){
                                        echo base_img($logoJson->real_name);
                                    }else{
                                        echo base_img($company->Company_Logo);
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    </div>

            </header>

            <div class="col-md-12">
                <ul class="list-group list-unstyled list-horizontal contact-company">
                    <!--li>
                        <i class="fa fa-taxi round box-icon-border"></i> <span class="lb"><?php echo __("LBL_DIRECT")?></span><span class="inner"><?php echo __("LBL_DIRECT")?></span>
                    </li-->
                    <?php if($company->Contact->Tel){?>
                    <li class="Telephone"><i class="fa fa-phone round box-icon-border"></i> <span class="lb"><?php echo __("LBL_TELEPHONE");?></span><span class="inner"><?php echo $company->Contact->Tel?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Fax){?>
                    <li class="Fax"><i class="fa fa-fax round box-icon-border"></i> <span class="lb"><?php echo __("LBL_FAX");?></span><span class="inner"><?php echo $company->Contact->Fax?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Email){?>
                    <li class="Email"><i class="fa fa-envelope round box-icon-border"></i> <span class="lb"><?php echo __("LBL_EMAIL");?></span> <span class="inner sendEmail" data-title="<?php echo $company->Company_Name?>" data-company="<?php echo $company->id?>"><?php echo $company->Contact->Email?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Website){?>
                    <li class="Website"><i class="fa fa-link round box-icon-border"></i> <span class="lb"><?php echo __("LBL_WEBSITE");?></span> <span class="inner"><?php echo anchor($company->Contact->Website,$company->Contact->Website,'target="_blank"')?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Facebook){?>
                    <li class="Facebook"><i class="fa fa-facebook round box-icon-border"></i> <span class="lb"><?php echo __("LBL_FACEBOOK");?></span> <span class="inner"><?php echo anchor($company->Contact->Facebook,$company->Contact->Facebook,'target="_blank"')?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Twitter){?>
                        <li class="Twister"><i class="fa fa-twitter round box-icon-border"></i> <span class="lb"><?php echo __("LBL_TWITTER");?></span> <span class="inner"><?php echo anchor($company->Contact->Twitter,$company->Contact->Twitter,'target="_blank"')?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Google){?>
                        <li class="Google"><i class="fa fa-google-plus round box-icon-border"></i> <span class="lb"><?php echo __("LBL_GOOGLEPLUS");?></span> <span class="inner"><?php echo anchor($company->Contact->Google,$company->Contact->Google,'target="_blank"')?></span></li>
                    <?php }?>
                    <?php if($company->Contact->Youtube){?>
                        <li class="Youtube"><i class="fa fa-youtube round box-icon-border"></i> <span class="lb"><?php echo __("LBL_YOUTUBE");?></span> <span class="inner"><?php echo anchor($company->Contact->Youtube,$company->Contact->Youtube,'target="_blank"')?></span></li>
                    <?php }?>
                </ul>
            </div>
        </div>

        <?php if(!empty($company->Categories)){?>
        <div class="row">
            <div class="col-md-2 ">
                <h2 class="h2upper text-danger" style="font-size: 1em; font-weight: bold; line-height: 1.8em;"><?php echo __("LBL_COMPANY_CATEGORY")?>:</h2>
            </div>
            <div class="col-md-10">
                <ul class="list-group list-horizontal list-unstyled">
                    <?php
                    foreach($company->Categories as $cate){
                        $keywords = preg_split("/[-,]+/", $cate);
                        foreach($keywords as $word){
                            echo '<li>'.anchor('nganh-nghe/'.to_slug($word),$word,array('class'=>'')).'</li>';
                        }
                    }
                    ?>
                </ul>
            </div>
        </div>
        <?php }//end category?>

        <div class="row">
            <?php
            if(!empty($company->Get_In_Touch[0]) || ($company->MST || $company->Establish || $company->Company_Size)){ $col =7; }else{ $col = 12; }
            ?>
            <div class="col-md-<?php echo $col;?>">
                <?php echo $company->Company_Profile?>
            </div>
            <?php if($col == 7){?>
            <div class="col-md-5">
                <?php if(!empty($company->Get_In_Touch[0])){?>
                <h4><?php echo __("LBL_GET_IN_TOUCH")?></h4>
                <?php foreach($company->Get_In_Touch as $contact){?>
                <ul class="list-group list-unstyled get_in_touch">
                    <?php foreach($contact as $k=>$v){
                        if($v){?>
                    <li class="clear" style="word-break: break-all;">
                        <?php echo page_contact_icon($k);?>
                        <?php echo $v;?></li>
                    <?php
                        }
                    }?>
                </ul>
                <?php }?>
                <?php
                   // $company->MST ="12421421424"; $company->Establish = 1995; $company->Company_Size= "100 người";
                    if($company->MST || $company->Establish || $company->Company_Size){?>
                        <h4><?php echo __("LBL_COMPANY_INFOR")?></h4>
                        <ul class="list-group list-unstyled get_in_touch">
                            <?php if($company->MST){?>
                                <li class="clear">
                                   <i class="fa fa-info-circle box-icon box-icon-info" style="display: inline-block;"></i>
                                    <?php echo __("LBL_MST")?>: <?php echo $company->MST;?>
                                </li>
                            <?php }?>
                            <?php if($company->Establish){?>
                            <li class="clear">
                                <i class="fa fa-building box-icon box-icon-info" style="display: inline-block;"></i>
                                <?php echo __("LBL_ESTABLISH")?>: <?php echo $company->Establish;?>
                            </li>
                            <?php }?>
                            <?php if($company->Company_Size){?>
                            <li class="clear">
                                <i class="fa fa-users box-icon box-icon-info" style="display: inline-block;"></i>
                                <?php echo __("LBL_COMPANY_SIZE")?>: <?php echo $company->Company_Size;?>
                            </li>
                            <?php }?>
                       </ul>
                <?php }?>

                    <?php
//                    $company->Brochure = 'xyz/abc.pdf';
                    $brochure = pathinfo($company->Brochure,PATHINFO_BASENAME);
                    if($company->Brochure){
                        echo anchor('common/brochure/'.$company->id.'/'.$brochure,base_img('asset/icon-download-brochure.gif',array('class'=>'imgOrginal')));
                    }?>
                <?php }?>
            </div>
            <?php }?>
        </div>
        <!--End Company profile -->

        <?php

        if(!empty($company->Product_Serivces)){?>
            <div class="row">
                <div class="col-md-12 ">
                    <h2 class="h2upper text-danger" style="font-size: 1.2em; line-height: 2.2em;"><?php echo __("LBL_COMPANY_PRODUCT_SERVICE")?>:</h2>
                </div>
           </div>
            <div class="row">


                        <?php

                        foreach($company->Product_Serivces as $group){

                            if(isset($group->items))foreach($group->items as $word){
                                echo '<div class="col-md-6">'.anchor('san-pham/'.urlencode($word),$word,array('class'=>'')).'</div>';
                            }else{
                                echo '<div class="col-md-6">'.anchor('san-pham/'.urlencode($group),$group,array('class'=>'')).'</div>';
                            }
                        }
                        ?>


            </div>
        <?php }//end category?>

        <?php if(!empty($company->Gallery[0])){?>
        <div class="gap"></div>
            <hr/>
        <div class="">
            <div class="col-md-12">
                <?php foreach($company->Gallery as $k=>$gallery){?>
                <div id="popup-gallery-<?php echo ($k+1);?>" class="row row-wrap popup-gallery galleryWrap">
                    <div class="row row-wrap">
                    <div class="col-md-12">
                        <h4><?php echo $gallery->label;?></h4>
                    </div>
                    </div>
                    <div class="row row-col-gap">
                    <?php foreach($gallery->items as $item){?>
                    <div class="col-md-3 ">
                        <a  data-effect="mfp-zoom-out" href="<?php echo ROOT_URL. $item;?>" class="hover-img popup-gallery-image">
                            <div class="thumb">
                            <img  src="<?php echo  ROOT_URL. $item;?>"><i class="fa fa-plus round box-icon-small hover-icon i round"></i>
                            </div>
                        </a>
                    </div>

                    <?php }?>
                    </div>
                </div>
                <?php }?>
            </div>
        </div>
        <?php }//end gallery?>
    </div>
    <div class="col-md-4">
        <?php
            if(!$company->status) {
                ?>
                <div class="notApproved">
                    <?php echo base_img('asset/not_approved.png'); ?>
                </div>
                <?php
            }
        ?>
        <aside class="sidebar-right">
            <div class="sidebar-widget">
                <div class="googleMap">
                    <?php
        //            echo "$company->Lat,$company->Long,$company->Company_Name";
                    $MAP_OBJECT = new GoogleMapAPI('company_map');
                    $MAP_OBJECT->setZoomLevel(15);
                    $MAP_OBJECT->setWidth('100%');
                    $MAP_OBJECT->setHeight('300');
                    $MAP_OBJECT->center_lat = $company->Lat;
                    $MAP_OBJECT->center_lon= $company->Long;
                    $MAP_OBJECT->addMarkerByCoords($company->Long,$company->Lat,'C',$company->Company_Name,'');
                    ?>
                    <?php echo $MAP_OBJECT->getMapJS();?>

                    <?php echo $MAP_OBJECT->printOnLoad();?>
                    <?php echo $MAP_OBJECT->printMap();?>
                </div>
            </div>

            <div class="sidebar-widget">
                <h4><?php echo __("LBL_ENQUIRY_FORM")?></h4>
                <?php
                $formBase = new FormBase();
                $formBase->focus_first = false;
//                $formEmail = new stdClass();
//                $formEmail->first_name = 'Do';
//                $formEmail->last_name = 'Luc';
//                $formEmail->email = 'lucdt@ideavietnam.com';
//                $formEmail->phone = '12345678';
//                $formEmail->content ='test content';

                echo $formBase->create('home/company/sendMail/',array('id'=>'formEnquiry','ajax'=>array('Callback'=>'homeController.cbEnquire')));
//                $formBase->fillData($formEmail);
                echo $formBase->hidden('company_id',array('value'=>$company->id));
                ?>
                <div class=""><?php echo __("MSG_SEND_MESSAGE_COMPANY");?></div>

                    <div class="form-group">
                        <?php echo $formBase->input('first_name',array('placeholder'=>'LBL_FIRST_NAME','class'=>'form-control','rules'=>'required'))?>
                    </div>
                    <div class="form-group">
                        <?php echo $formBase->input('last_name',array('placeholder'=>'LBL_LAST_NAME','class'=>'form-control','rules'=>'required'))?>
                    </div>
                    <div class="form-group">
                        <?php echo $formBase->input('email',array('placeholder'=>'LBL_EMAIL','class'=>'form-control','rules'=>'required|valid_emails'))?>
                    </div>
                    <div class="form-group">
                        <?php echo $formBase->input('phone',array('placeholder'=>'LBL_TELEPHONE','class'=>'form-control','rules'=>'required|phone_number'))?>
                    </div>

                <div class="form-group">
                    <?php echo $formBase->textarea('content',array('placeholder'=>'LBL_CONTENT','rows'=>5,'class'=>'form-control','rules'=>'required'))?>
                </div>

                    <?php echo $formBase->submit('cmdSend',array('label'=>"BTN_SEND")); echo ' '.img_ajax('formEnquiry_img')?>
                 <?php echo $formBase->end()?>


            </div>
        </aside>

    </div>
</div>

</div>
<div class="gap"></div>
<script>
    $(document).ready(function(){
        $('.sendEmail').click(function(){
            Common.sendMail(this);
        });
    })
</script>