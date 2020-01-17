<?php
require('invokee.php');

function yee() {
    yee1();
}

function yee1() {
    yee2();
}

function yee2() {
    $i = new invokee();
    $i->test();
}

yee();
