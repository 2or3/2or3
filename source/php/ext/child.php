<?php

class granpa {
    public static function test1() {
    }
    
    protected function test2() {
    }
}

class father extends granpa {
    public function others() {
        echo "other";
    }
}

class child extends father {
    public static function test1() {
        echo "test1";
    }
    
    protected function test2() {
        echo "test2";
    }
}

$c = new child();
$c->test2();
