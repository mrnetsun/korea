<?php

// upload_dir must be a single public root level directory
$config['upload_dir'] = dirname(dirname(BASEPATH)).'/uploads/';

$config['primary_dir'] = date('Y');

$config['secondary_dir'] = date('m');

$config['acceptable_files'] = 'xml|mp3|png|jpg|gif|txt|pdf|zip|doc|xls|docx';

$config['max_kb'] = '2000000';

$config['max_width'] = '1024000000';

$config['max_height'] = '76800000';