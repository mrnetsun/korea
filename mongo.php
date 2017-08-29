<?php
$db = new Mongo('mongodb://localhost', array(
    'username' => 'abc',
    'password' => 'abc@123',
    'db'       => 'abc'
)) or die('xxx');