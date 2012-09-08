
--------------------------------------------------------------------
<?php
    if ( $argc > 1 && file_exists($argv[1]) ) {
        check(file($argv[1]));
     } else if ($argc > 1) {
        print "\nFile `".$argv[1]."` doesn't exist.\n";
     }

function check($lines) {
    $count = 0;
    $comment = false;
for ( $i = 0, $l = count($lines); $i < $l; $i++ ) { 
    $line = rtrim($lines[$i]);
    if  ( preg_match("/\s;/", $line) ) {
         print "Line {$i}: ; の前のスペースは不要です。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/;[^\s]/", $line) ) {
         print "Line {$i}: ; の後にはスペースを入れましょう。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/^\s*\/\*$/", $line) ) {
         $comment = true;
    } else if  ( preg_match("/^\s+\*\/$/", $line) ) {
         $comment = false;
    }
    if  ( preg_match("/(if|foreach|for|catch)\(/", $line) ) {
         print "Line {$i}: 制御の ( の前にスペースがありません。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/try{/", $line) ) {
         print "Line {$i}: try の { の前にスペースがありません。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/}[^\s]/", $line) && ! preg_match("/\/\/\s\}\}\}/", $line) ) {
         print "Line {$i}: } のあとにスペースがありません。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/(if|foreach|for|try|catch)[^\{\s]$/", $line) ) {
         print "Line {$i}: 制御の { は改行せずに書きましょう。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/\)\{/", $line) ) {
         print "Line {$i}: 制御ブロック { の前にスペースがありません。: {$line}\n";
         $count++;
    }
    if  ( preg_match("/\(\s/", $line) ) {
         print "Line {$i}: ( の後のスペースは不要です。: {$line}\n";
         $count++;
    }
/*
    if  ( preg_match("/[\"\']\./", $line) || preg_match("/\.[\"\']/", $line) ) {
         print "Line {$i}: . 演算子の前後には制御ブロック { の前にスペースがありません。: {$line}\n";
         $count++;
    }
 */
    if ( preg_match("/function/", $line) && ! preg_match("/^[\s]{4}\s\*\//", $prev) ) {
        print "Line {$i}: function の前にはコメントを書きましょう(スペース5 + */ で判定): {$line}\n";
        $count++;
    }
    if ( preg_match("/class/", $line) && ! preg_match("/^\s\*\//", $prev) ) {
        print "Line {$i}: class の前にはコメントを書きましょう(スペース + */ で判定): {$line}\n";
        $count++;
    }
    if ( preg_match("/\s\)/", $line) && ! preg_match("/^([\s]{4})+\)/", $line) ) {
        print "Line {$i}: ) の前のスペースは不要です。: {$line}\n";
        $count++;
    }
    if ( preg_match("/,[^\s]/", $line) ) {
        print "Line {$i}: , の後にはスペースを入れましょう。: {$line}\n";
        $count++;
    }
    if ( preg_match("/[^=]==[^=]/", $line) ) {
        print "Line {$i}: 比較には === を使うことが推奨されます {$line}\n";
        $count++;
    }
    if ( preg_match("/[^\s\=]([\=><\-\+i\&\|\*\/\.]{,2})[^\s\=]/", $line) ) {
        print "Line {$i}: 演算子の前後にはスペースを入れます {$line}\n";
        $count++;
    }
    if ( ! preg_match("/^([\s]{4})*[^\s]/", $line) && preg_match("/[^\s]/", $line) && ! preg_match("/^[\s]+\*\/$/", $line) && ! preg_match("/^([\s]{4})*\s\*/", $line) ) {
        print "Line {$i}: インデントは 4 スペースを使って下さい {$line}\n";
        if ( ! $comment) $count++;
    }
    if ( preg_match("/function.+\{/", $line) ) {
        print "Line {$i}: 関数は改行したあとに { を入れてください {$line}\n";
        $count++;
    }
    if ( preg_match("/^class.+\{/", $line) ) {
        print "Line {$i}: 関数は改行したあとに { を入れてください {$line}\n";
        $count++;
    }
    if ( preg_match("/^(public|protcted).+function\s_[^\(]+\(/", $line) ) {
        print "Line {$i}: _ から始まるメソッドはprivateだけです {$line}\n";
        $count++;
    }
    if ( preg_match("/^\s+private\s+(static\s+)?function\s+[^_]/", $line) ) {
        print "Line {$i}: private なメソッドは _ から始めてください {$line}\n";
        $count++;
    }
    $prev = $line;
} // end of for
    exit("\n--------------------------------------------------------------------\n".$count . " 件のエラー疑惑が見つかりました。\n\nスペースの数は4の倍数かどうか、しかチェックしてません。\n\n");
}
 ?>

php coding.php チェックしたいファイル名

で入力してください。


