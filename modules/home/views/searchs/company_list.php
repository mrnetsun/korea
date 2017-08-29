<div id="companyList">
    <?php
    $refine = $this->session->userdata('Company.Refine');
    $strRefine = array();
    if(!empty($refine))foreach($refine as $r=>$g){
        foreach($g as $v){
           if($v) $strRefine[] = trim($v);
        }
    }
    $strRefine = implode(', ',$strRefine);
    ?>
    <div id="refineWrap" class="row">
        <div class="actionRefine clear">

                <div class="col-md-7" style="text-align: left;">
                    <a onclick="$('#frmRefine').slideToggle();" class="btnRefine">
                        <i class="fa fa-angle-down"></i> <?php echo __("LBL_FILTER")?>
                    </a>
                    <?php echo img_ajax('img_company_refine','loadinfo4.gif',array('width'=>'25px','height'=>'25px'))?>
                </div>
                <div class="col-md-5 text-right">
                    <?php echo __("LBL_SORT")?> :

            <span class="companySort" style="position: relative;">
                <a id="dropdownSort" class="pointer dropdown-toggle" data-toggle="dropdown" type="button" data-toggle="dropdown" style="line-height: 2.2em;">
                    <?php
                    $arySort = array(
                        1=>__("LBL_FILTER_BY_RANK"),
                        2=>__("LBL_FILTER_BY_NAME"),
                        3=>__("LBL_FITER_BY_DATE"),
                        4=>__("LBL_FITER_BY_LOCATION"),

                    );
                    $typeSort = $this->session->userdata('Company.Sort');
                    if(!$typeSort) $typeSort = 1;

                    echo $arySort[$typeSort];

                    ?>
                    <i class="fa fa-angle-down"></i></a>

                    <div style="position: absolute; top:0px; right: -10px;">
                        <?php echo img_ajax('img_company_load','loadinfo4.gif',array('width'=>'25px','height'=>'25px'))?>
                    </div>

                <ul class="dropdown-menu" role="menu"  aria-labelledby="dropdownSort" style="position: absolute; top: 25px; width: 10em; right: 0px; ">
                    <li>
                        <a class="pointer sortItem" data-sort="1" >
                            <?php echo __("LBL_FILTER_BY_RANK");?>
                        </a>
                    </li>
                    <li>
                        <a class="pointer sortItem" data-sort="2" >
                            <?php echo __("LBL_FILTER_BY_NAME")?>
                        </a>
                    </li>
                    <li>
                        <a class="pointer sortItem" data-sort="3" >
                            <?php echo __("LBL_FITER_BY_DATE")?>
                        </a>
                    </li>
                    <li>
                        <a class="pointer sortItem" data-sort="4" >
                            <?php echo __("LBL_FITER_BY_LOCATION")?>
                        </a>
                    </li>
                </ul>
            </span>
                </div>
            <div class="clear"></div>


        </div>
        <?php if($strRefine){?>
            <div class="">
            <div class="col-md-12" style="text-align: left; padding: 5px; text-transform: capitalize;">
                <div id="selectedRefine" style="float: left; padding-left: 15px;"><i class="fa fa-check-circle-o"></i> <?php echo tokenTruncate($strRefine,120);?></div>
                <div style="float: right"><a class="pointer" onclick="homeController.clearRefine()"><i class="fa fa-trash-o"></i> <?php echo __("LBL_DELETE");?></a></div>

            </div>
            </div>
        <?php }?>

        <form id="frmRefine" style="display: none;">
        <?php

         $facets = refineArray($results['facet_counts']['facet_fields']);
         foreach($facets as $group_key=>$group){
             if($group) {
                 echo '<ul class="list-unstyled refineGroup col-md-4">';
                 echo '<li class="refineTitle">' . __('LBL_' . $group_key) . '</li>';
                 $i = 0;
                 if(empty($refine[$group_key])) $refine[$group_key] = array();
                 foreach ($group as $k => $v) {
                     $checked = (in_array($k,$refine[$group_key]))?'checked="checked"':'';
                     $i++;
                     echo '<li class="tdRow">';
                     echo '<label><div class="tdCell"><input type="checkbox" '.$checked.' name="refine['.$group_key.'][]" value="' . $k . '">&nbsp;</div><div class="tdCell"> ' . $k . '(' . $v . ')</div></label>';
                     echo '</li>';
                     if ($i == 5) break;
                 }
                 if (count($group) > 5) {
                     echo '<li class="refineMore pointer"><a data-key="'.$group_key.'" data-title="'. __('LBL_' . $group_key).'" class="moreRefine" class="pointer">' . __("LBL_MORE") . '</a></li>';
                 }
                 echo '</ul>';
             }
         }
        ?>
            <div class="gap-mini"></div>
        </form>

    </div>
    <div class="gap-mini"></div>

    <div class=" banner_search1">
        <?php echo page_banner('SEARCH1')?>
    </div>
    <div class="gap-mini"></div>
    <ul class="booking-list">
    <?php


    foreach($results['response']['docs'] as $k=>$item){
//        debug($item);
    ?>
    <li class="booking-item <?php echo ($item['Sponsor'])?'sponsor':'';?>">
        <div class="booking-inner">
        <div class="row">
                <div class="col-md-9">
                    <div class="positionBlock"><?php echo $k+1?></div>
                    <h5 class="booking-item-title ">

                        <?php echo anchor('doanh-nghiep/'.$item['Company_Slug'],$item['Company_Name'])?></h5>

                    <div>
                        <?php
                        echo page_star($item['Rate'],$item['RatTotal']);
                        if($item['Verified']){
                            ?>
                            <div class="verified_status">
                                <?php echo __("LBL_VERIFIED")?>
                            </div>
                            <?php
                        }else{
                            ?>
                            <div class="verified_status not_yet">
                                <?php echo __("LBL_NOT_VERIFIED")?>
                            </div>
                            <?php
                        }
                        ?>

                    </div>

                    <div class="gap-mini"></div>
                    <p class="booking-item-address bold"><i class="fa fa-map-marker"></i>

                    <?php echo $item['Address'][0]?>
                    </p>


                </div>
                <div class="col-md-3">
                    <div class="feature_logo">
                        <?php echo anchor('doanh-nghiep/'.$item['Company_Slug'],base_img($item->Company_Logo,array('alt'=>$item['Company_Slug'],'class'=>'logo-border'),'asset/nologo.png'),array('class'=>''));?>
                    </div>

                </div>
            </div>
        <div class="gap-mini"></div>
        <div class="row">
                <div class="col-md-12">
                    <?php
                    echo tokenTruncate(strip_tags($item['Company_Profile']),200);
                    ?>
                </div>
            </div>
        <div class="gap-mini"></div>
        <div class="row">
            <div class="col-md-2 bold">
                <?php echo __("LBL_COMPANY_CATEGORIES")?>
            </div>
            <div class="col-md-10">
                <ul class="list-tag list-unstyled">
                <?php if($item['Categories']){
                    foreach($item['Categories'] as $cate){
                        echo '<li>'.anchor('nganh-nghe/'.to_slug($cate),$cate).'</li>';
                    }
                }else{
                    echo '<i>'.__("LBL_NOT_REGISTER_YET").'</i>';
                }?>
                </ul>
            </div>
         </div>
        </div>
        <div class="list_contact">
        <div >
            <ul class="list-group list-unstyled list-horizontal contact-company">
                <!--li>
                    <i class="fa fa-taxi round box-icon-border"></i> <span class="lb"><?php echo __("LBL_DIRECT")?></span><span class="inner"><?php echo __("LBL_DIRECT")?></span>
                </li-->
                <?php if($item['Tel'][0]){?>
                    <li class="Telephone"><i class="fa fa-phone round box-icon-border"></i> <span class="lb"><?php echo __("LBL_TELEPHONE");?></span><span class="inner"><?php echo $item['Tel'][0]?></span></li>
                <?php }?>

                <?php if($item['Email_Address']){?>
                    <li class="Email"><i class="fa fa-envelope round box-icon-border"></i> <span class="lb"><?php echo __("LBL_EMAIL");?></span> <span class="inner sendEmail" data-title="<?php echo $item['Company_Name']?>" data-company="<?php echo $item['id']?>"><?php echo $item['Email_Address']?></span></li>
                <?php }?>
                <?php if($item['Website']){?>
                    <li class="Website"><i class="fa fa-link round box-icon-border"></i> <span class="lb"><?php echo __("LBL_WEBSITE");?></span> <span class="inner"><?php echo anchor($item['Website'],$item['Website'],'target="_blank"')?></span></li>
                <?php }?>

            </ul>
        </div>

</div>
    </li>
    <?php
    }//end-for
    ?>
</ul>

 <?php
 echo $pagination->pagination($start);
// debug($results['response']['docs'] );
 ?>
 </div>
<div class="gap"></div>

<script>

    var locations = [
        <?php
        $location = array();

        if($results['response']['docs']) {
            foreach ($results['response']['docs'] as $k => $item) {

                $geo = explode(',', $item['Location']);
                $location[] = '["<b>' . $item['Company_Name'].'</b><br><i class=\'fa fa-map-marker\'></i> '.str_replace('"','',$item['Address'][0]). '<br><i class=\'fa fa-phone\'></i> '.str_replace('"','',$item['Tel'][0]).'",' . $geo[0] . ',' . $geo[1] . ',' . ($k + 1) . ',"'.site_url("doanh-nghiep/".$item['Company_Slug']).'"]';
            }
        }
        echo implode(',',$location);
        ?>
    ];


   $(document).ready(function(){

       var image = '<?php echo ROOT_URL?>/themes/front/images/marker-c.png';

       var infowindow = new google.maps.InfoWindow();

       var marker, i;

       map.clearMarkers();

       for (i = 0; i < locations.length; i++) {
           var k = i +1;
           marker = new MarkerWithLabel({
               position: new google.maps.LatLng(locations[i][1], locations[i][2]),
              // animation: google.maps.Animation.DROP,
               icon: '<?php echo ROOT_URL?>asset/marker2/'+k+'.png',
               url:locations[i][4],
               info:locations[i][0],
               //labelContent: k.toString(),
               //labelAnchor: new google.maps.Point(22, 0),
               // labelClass: "labelsGoogle", // the CSS class for the label
               map: map
           });

           google.maps.event.addListener(marker, 'mouseover', function() {

               infowindow.setContent(this.info);
               infowindow.open(map, this);
           });
           google.maps.event.addListener(marker, 'mouseout', function() {
               infowindow.close();
           });

           google.maps.event.addListener(marker, 'click', function() {
               document.location = this.url;
           });
       }


       $('.sendEmail').click(function(){
           Common.sendMail(this);
       });

       $('.companySort a.sortItem').click(function(){
           homeController.sortBy(this);
       });

      $('#frmRefine :input[type=checkbox]').change(function(){
          homeController.refine();
      });

       $('.moreRefine').click(function(){
           homeController.getMoreRefine(this);
       });


       $('.contact-company li').click(function(){
           $(this).parent().find('.active').removeClass('active');
           $(this).addClass('active');
       });

   });
</script>