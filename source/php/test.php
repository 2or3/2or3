<?php
$b=array(3,5,8);

for($i=0; $i<3; $i++)
{
    $a = 'test'.$i;
    $$a = $b[$i];
}

echo $test0."\n";
echo $test1."\n";
echo $test2."\n";
