<?php
if(count($argv) > 1){
for ($i = 1; $i < $argv[1]; $i++)
{
    if($i % 3 == 0 && $i % 5 == 0){
        echo "fizzbuzz\n";
    }else if($i % 3 == 0){
        echo "fizz\n";
    }else if($i % 5 == 0){
        echo "buzz\n";
    }else{
        echo $i."\n";
    }
}
}else{
    echo "引数を入力してください。";
}
