<?php
$current_uri = strtolower($this->router->fetch_module().'/'.$this->router->fetch_class());
echo $template['partials']['header']; ?>
<?php echo $template['partials']['navigation_toolbar']; ?>
<?php echo $template['body']; ?>
<?php echo $template['partials']['footer']; ?>
