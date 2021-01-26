<?php
/**
 * Test code
 * PHP Version >= 5.4
 *
 * @category   Components
 * @package    Collarks
 * @subpackage Unicode_Test
 * @author     Tsukasa Nagashima <2or3@gmail.com>
 * @license    https://www.gnu.org/licenses/gpl-3.0.txt GNU/GPLv3
 * @link       https://example.com
 * @since      1.0.0
 */

// タグの条件
define("PAT_TAG", "(^|[\s])([#＃]\S+)");

// $str1
$str1 = 'タグは #1 #2 です';
echo "$str1\n";
var_dump(Extract_Tag_arr($str1)); // -> `1`と`2`が得られる

// str2
$str2 = 'タグは #1 #2 です';
echo "$str2\n";
var_dump(Extract_Tag_arr($str2)); // -> `1 #2`が得られてしまう

$str3 = 'タグは #1\20001#2 です';
echo "$str3\n";
var_dump(Extract_Tag_arr($str3)); // -> `1\\20001#2`が得られてしまう

/**
 * $str からタグ配列を得る
 *
 * @param string $str input vars
 *
 * @return array
 */
function Extract_Tag_arr($str)
{
    // タグ抽出
    $tag_arr = [];
    preg_match_all('/'.PAT_TAG.'/u', $str, $ms);
    foreach ( $ms[0] as $m ) {
        $tag_arr[] = preg_replace(
            '/(\A[\p{Cc}\p{Cf}\p{Z}]++|[\p{Cc}\p{Cf}\p{Z}]++\z)(#|＃)/u', '', $m
        );
    }
    return $tag_arr;
}
