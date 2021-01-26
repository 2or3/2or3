<?php
/**
 * Test code
 * PHP Version >= 5.4
 *
 * @category   Components
 * @package    Collarks
 * @subpackage Json_Test
 * @author     Tsukasa Nagashima <2or3@gmail.com>
 * @license    https://www.gnu.org/licenses/gpl-3.0.txt GNU/GPLv3
 * @link       https://example.com
 * @since      1.0.0
 */
$json_text = <<<"EOT"
{
  "payload": [
    {
      "annotationSpecId": "4608744824823035797",
      "classification": {
        "score": 0.906407874
      },
      "displayName": "hogehoge1"
    },
    {
      "annotationSpecId": "9220430843250414364",
      "classification": {
        "score": 0.09359213
      },
      "displayName": "hogehoge2"
    }
  ]
}
EOT;

$json = json_decode($json_text,true);
var_dump($json["payload"][0]["classification"]["score"]);
