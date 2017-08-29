<?php

error_reporting(0); //Setting this to E_ALL showed that that cause of not redirecting were few blank lines added in some php files.
ini_set('max_execution_time', 600); //300 seconds = 5 minutes
if(file_exists('install.lock')){
	die("<center><h1>You allready installed.</h1>
		<div>Please remove file <b>".realpath('install.lock')."</b> if you want to reinstall.</div>
	</center>");
}

$db_config_path = '../sapplication/config/database.php';

// Only load the classes in case the user submitted the form
if($_POST['cmdConfigDB']) {

	// Load the classes and create the new objects
	require_once('includes/core_class.php');
	require_once('includes/database_class.php');

	$core = new Core();
	$database = new Database();


	// Validate the post data
	if($core->validate_post($_POST) == true)
	{

		// First create the database, then create tables, then write config file
		if($database->create_database($_POST) == false) {
			$message = $core->show_message('error',"The database could not be created, please verify your settings.");
		} else if ($database->create_tables($_POST) == false) {
			$message = $core->show_message('error',"The database tables could not be created, please verify your settings.");
		} else if ($core->write_config($_POST) == false) {
			$message = $core->show_message('error',"The database configuration file could not be written, please chmod sapplication/config/database.php file to 777");
		}

		// If no errors, redirect to registration page
		if(!isset($message)) {
		    $redir = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") ? "https" : "http");
            $redir .= "://".$_SERVER['HTTP_HOST'];
            $redir .= str_replace(basename($_SERVER['SCRIPT_NAME']),"",$_SERVER['SCRIPT_NAME']);
            $redir = str_replace('install/','',$redir);
			header( 'Location: ' . $redir . 'home' ) ;
		}

	}
	else {
		$message = $core->show_message('error','Not all fields have been filled in correctly. The host, username, password, and database name are required.');
	}
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>Install | Your App</title>

		 
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min"/>
	</head>
	<body>
	<div style="Margin:20px;">
    <center><h1>Install Application</h1></center>
    <?php if(is_writable($db_config_path)){?>

		  <?php if(isset($message)) {echo '<p class="error">' . $message . '</p>';}

            $action = $_GET['action'];

            switch($action){
                case 'configapp':
                    ?>
                    ABC
                    <?php
                    break;
                default:
                    ?>
                        <form id="install_form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>?action=configapp">
                            <fieldset>
                                <legend>Database settings</legend>
                                <div class="control-group">
                                    <label class="control-label" for="hostname">Hostname</label>
                                    <div class="controls">
                                        <input type="text" id="hostname" value="localhost" class="input_text" name="hostname" />
                                    </div>
                                </div>



                                <div class="control-group">
                                    <label class="control-label" for="username">Username</label>
                                    <div class="controls"><input type="text" id="username" class="input_text" name="username" />
                                    </div></div>
                                <div class="control-group">
                                    <label class="control-label" for="password">Password</label>
                                    <div class="controls"><input type="password" id="password" class="input_text" name="password" />
                                    </div></div>
                                <div class="control-group">
                                    <label class="control-label" for="database">Database Name</label>
                                    <div class="controls">
                                        <input type="text" id="database" class="input_text" name="database" />
                                    </div></div>
                                <div class="form-actions">

                                    <input type="submit" name="cmdConfigDB" value="Install" class="btn btn-primary" id="submit" />
                                </div>
                            </fieldset>
                        </form>

                    <?php
            }
          } else { ?>
      <p class="error">Please make the sapplication/config/database.php file writable. <strong>Example</strong>:<br /><br /><code>chmod 777 sapplication/config/database.php</code></p>
	  <?php } ?>
	</div>
	</body>
</html>