<?php
include 'ChromePhp.php';
ChromePhp::useFile('/Applications/MAMP/htdocs/chromephplogs', '/chromephplogs');
ChromePhp::log('hello world');
ChromePhp::log($_SERVER);

// using labels
foreach ($_SERVER as $key => $value) {
ChromePhp::log($key, $value);
}

// warnings and errors
ChromePhp::warn('this is a warning');
ChromePhp::error('this is an error');
?>
