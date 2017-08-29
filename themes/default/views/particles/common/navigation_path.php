	<?php
	if($LoginData){

	if(!$LoginData->isSA){
	//debug($LoginData,false);

        switch($LoginData->roleId){
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

        if(strtolower($this->_module)=='doing'){
            $type = "Doing";
        }
        $aryMenu = getModuleMenu('',0,array('menuType'=>$type));

	?>
	<nav id="navigation" class="non-printable">
			<div class="shell">
				<ul>

                    <!--li class=""><a href="<?php echo site_url("home");?>"><?php echo __("Home");?></a></li-->

					<?php
					//debug($aryMenu);

					foreach($aryMenu as $menu) {
						if (isUserViewMenu($menu, $LoginData->permission)) {
							$dropdown = 0;
							$active = '';
							if (is_menu_active($menu)) {
								$active = 'active';
							}

							if (($menu->menuLink != 'auth' && $menu->menuLink != 'auth/signup')) {

								if ($menu->children) {
									$active .= " dropdown menu_".strtolower(str_replace(' ','',strtolower($menu->menuName)))." ";
									$dropdown = 1;
								}
								$strClass=  'menu_'.str_replace(' ','',strtolower($menu->menuName));

								echo '<li class="' . $active . '" menuClass=".'.$strClass.'" onclick="Common.sysncMenu(this,true)"><a';
								if ($dropdown) {
									echo ' data-toggle="dropdown" class="dropdown-toggle" ';
								}
								echo ' HREF="' . site_url($menu->menuLink) . '"><span class="bottom-arr"></span>' . __($menu->menuName);
								if ($dropdown) {
									echo '<b class="caret"></b>';
								}
								echo '</a>';
								if ($dropdown) {
									echo '<ul class="dropdown-menu">';
									foreach ($menu->children as $v) {
										if(isUserViewMenu($v,$LoginData->permission)) {
											$link = ($v->menuLink) ? site_url($v->menuLink) : '#';
											$active = (is_menu_active($v)) ? 'active' : '';

											echo '<li class="' . $active . '"><a href="' . $link . '"><div>' . __($v->menuName) . '</div></a></li>';
										}
									}
									echo '</ul>';
								}
								echo '</li>';


							} else {
								if (!$LoginData) {
									echo '<li class="' . $active . '"><a href="' . site_url($menu->menuLink) . '"><span class="bottom-arr"></span>' . __($menu->menuName) . '</a></li>';
								}
							}

						}
					}//for

					?>

				</ul>
			</div>
		</nav>
	<?php }else{

		$curentModule = $aryCurrentModule->modulePath;
		//debug($curentModule);
		?>
		<nav id="navigation">
				<div class="shell">

                    <ul>
                    <?php
                    	foreach($aryModules as $mod){
                    		$moduleMenu = getModuleMenu($mod->modulePath,0);
                    		$dropdown = 0;
							$active = ( strtolower($curentModule) == strtolower($mod->modulePath))?'active' : '';
							if($moduleMenu){
								$active.= " dropdown";
								$dropdown = 1;
							}

							if($mod->modulePath != 'system'){
								echo '<li class="'.$active.'"><a ';
								if($dropdown) {
									echo ' data-toggle="dropdown" class="dropdown-toggle" ';
								}
								echo ' HREF="'.site_url($mod->modulePath).'"><span class="bottom-arr"></span>'.__($mod->moduleName);
								if($dropdown){
									echo '<b class="caret"></b>';
								}
								echo '</a>';
								if($dropdown){
									echo '<ul class="dropdown-menu">';
									foreach ( $moduleMenu as $v ) {
										$link = ($v->menuLink)?site_url($v->menuLink):'#';
										$active = (current_url() == site_url($v->menuLink))? 'class="active"':'';

										echo '<li '.$active.'><a href="'.$link.'"><div>' . __($v->menuName) . '</div></a></li>';

									}
									echo '</ul>';
								}
								echo '</li>';
							}
						}

						if($mod->modulePath == 'system' && $LoginData->isSA){
							$moduleMenu = getModuleMenu('system',0);
							$dropdown = 0;
							$active = ( strtolower($curentModule) == strtolower('system'))?'active' : '';
							if($moduleMenu){
								$active.= " dropdown";
								$dropdown = 1;
							}

							echo '<li class="'.$active.'"><a ';
								if($dropdown) {
									echo ' data-toggle="dropdown" class="dropdown-toggle" ';
								}
								echo ' HREF="'.site_url($mod->modulePath).'"><span class="bottom-arr"></span>'.__($mod->moduleName);
								if($dropdown){
									echo '<b class="caret"></b>';
								}
								echo '</a>';
								if($dropdown){
									echo '<ul class="dropdown-menu">';
									foreach ( $moduleMenu as $v ) {
										$link = ($v->menuLink)?site_url($v->menuLink):'#';
										$active = (current_url() == site_url($v->menuLink))? 'class="active"':'';

										echo '<li '.$active.'><a href="'.$link.'"><div>' . __($v->menuName) . '</div></a></li>';

									}
									echo '</ul>';
								}
								echo '</li>';
						}
					?>
                    </ul>
                    </div>
                </nav>
	<?php }

	}
	?>