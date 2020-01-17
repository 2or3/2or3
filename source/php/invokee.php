<?php

class invokee {
    public function test() {
        $d = debug_backtrace();
        foreach ($d as $k => $dlist) {
            if ($dlist['function'] == __FUNCTION__) {
                echo $d[$k + 1]['function'] . "\n";
            }
        }
    }
}
