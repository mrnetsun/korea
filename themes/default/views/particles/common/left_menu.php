<?php

//echo $current_uri;
if($LoginData){



        switch ($LoginData->roleId) {
//            case 1: //Admin
//                $type= 'admin';
//                break;
//            case 2: //Member
//                $type= 'member';
//                break;
//            case 3: //Customer
//                $type= 'customer';
//                break;
            default:
                $type = 'main';
        }

        if (strtolower($this->_module) == 'doing') {
            $type = "Doing";
        }
        $aryMenu = getModuleMenu('', 0, array('menuType' => $type));



?>

<div id='cssmenu'>
    <ul>
        <?php
        foreach($aryMenu as $menu){

            if(isUserViewMenu($menu,$LoginData->permission)) {
                $dropdown = 0;
                $active = '';


                if(is_menu_active($menu)){
                    $active = 'active';
                }

                if($menu->children){
                    $active.= " dropdown";
                    $dropdown = 1;
                }
                $strClass=  'menu_'.str_replace(' ','',strtolower($menu->menuName));
                $link = ($menu->menuLink)?site_url($menu->menuLink):'#';
                echo "<li menuClass=".'.'.$strClass." onclick='Common.sysncMenu(this,false)' class='$active";
                echo ($dropdown)?"has-sub menu_".strtolower(str_replace(' ','',strtolower($menu->menuName)))."":'';
                echo "'><a href='$link'><span>".$menu->menuName."</span>";
                echo ( $dropdown===1 )?'<b class="caret"></b>':'';
                echo "</a>";
                if($dropdown){
                    echo '<ul>';
                    foreach ( $menu->children as $v ) {
                        if(isUserViewMenu($v,$LoginData->permission)) {
                            $link = ($v->menuLink) ? site_url($v->menuLink) : '#';
                            $active = (is_menu_active($v)) ? 'active' : '';

                            echo '<li class="' . $active . '"><a href="' . $link . '"><div>' . __($v->menuName) . '</div></a></li>';
                        }
                    }
                    echo '</ul>';
                }

                echo "</li>";
            }


        }//for
        ?>

    </ul>
</div>

<script>
    ( function( $ ) {
        $( document ).ready(function() {
            $('#cssmenu > ul > li > a').click(function() {
                //$('#cssmenu li').removeClass('active');
                $(this).closest('li').addClass('active');
                var checkElement = $(this).next();
                if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                    $('#cssmenu ul>li>a').find('b').remove();
                    $(this).closest('li').removeClass('active');
                    checkElement.slideUp('normal');

                }
                if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                    $('#cssmenu ul ul:visible').slideUp('normal');
                    checkElement.slideDown('normal');
                    //$('li').removeClass('active');
                    $('li').each(function(index, element) {
                        var isDisabled = $(element).attr('menuClass');
                        if (isDisabled) {
                            $(element).removeClass('active');
                        } else {
                            // Handle input is not disabled
                        }
                    });
                    $('#cssmenu ul>li>a').find('b').remove();
                    className = $(this).parent().attr('menuClass');
                    $(className).addClass('active');
                    $(this).first('a').append('<b class="caret"></b>');
                }
                if($(this).closest('li').find('ul').children().length == 0) {
                    return true;
                } else {
                    return false;
                }
            });

            $('#cssmenu > ul > li.active ul').slideDown('normal');
        });
    } )( jQuery );

</script>
<?php }?>