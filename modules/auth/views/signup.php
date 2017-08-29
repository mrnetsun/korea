<?php
$formBase = new FormBase();
echo pageHeader('LBL_REGISTER_NEW_MEMBER');
?>
 <div class="container">
	<div>
		<div class="cate-content">
			<div class="cate-list">
				<div class="row">
					<div class="col-md-6">
						<h4><?php echo __("LBL_REGISTER_INPUT_DATA")?></h4>
						<div class="gap"></div>
						<div>
							<?php
							echo $formBase->create('auth/register',array('class'=>'','ajax'=>array('Callback'=>'registerCallback')));
							?>
							<div class="row row-wrap">
								<div class="col-md-5">
									<div class="form-group">
										<label><?php echo __("LBL_FIRST_NAME")?></label>
										<?php echo $formBase->input('fistName',array('rules'=>'required','class'=>'form-control'));?>
									</div>
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5">
									<div class="form-group">
										<label><?php echo __("LBL_LAST_NAME")?></label>
										<?php echo $formBase->input('lastName',array('rules'=>'required','class'=>'form-control'));?>
									</div>
								</div>

								<div class="col-md-11">
									<div class="form-group">
										<label><?php echo __("LBL_EMAIL")?></label>
										<?php echo $formBase->input('email',array('rules'=>'required|valid_email','class'=>'form-control'));?>
									</div>
								</div>

								<div class="col-md-5">
									<div class="form-group">
										<label><?php echo __("LBL_PASSWORD")?></label>
										<?php echo $formBase->password('password',array('rules'=>'required|min_length[6]|matches[repassword]','class'=>'form-control'));?>
									</div>
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5">
									<div class="form-group">
										<label><?php echo __("LBL_RETYPE_PASSWORD")?></label>
										<?php echo $formBase->password('repassword',array('rules'=>'required|min_length[6]|matches[password]','class'=>'form-control'));?>
									</div>
								</div>
								<div class="col-md-11">
									<?php echo $formBase->submit('submit',array('label'=>'LBL_SINGUP','class'=>'btn btn-primary btn-large')); ?>
								</div>

							</div>
							 <?php
							echo $formBase->end();
							?>
						</div>
					</div>

					<div class="col-md-3">

						<h4><?php echo __("LBL_QUICK_REGISTER")?></h4>
						<div class="gap-big"></div>
						<a class="btn btn-social btn-facebook btn-block" href="<?php echo site_url('auth/session/facebook/register')?>"><i class="fa fa-facebook"></i> <?php echo __("LBL_FACEBOOK_REGISTER")?></a>
						<a class="btn btn-social btn-google-plus btn-block" href="<?php echo site_url('auth/session/google/register')?>"><i class="fa fa-google-plus"></i> <?php echo __("LBL_GOOGLE_REGISTER")?></a>
						<div class="gap"></div>
						<div class=""><?php echo __("LBL_NOT_ACCOUNT")?></div>
						<a title="" class="btn btn-default btn-block" href="<?php echo site_url('auth')?>"><?php echo __("BTN_LOGIN_NOW")?></a>

						</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="gap"></div>