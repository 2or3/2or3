<?php
class Search
{
  // const
  const DEF_FROM = 0;
  const DEF_TO = 100;

  // field
  private $list = array();
  private $aligned_list = array();

  // constructor
  function __construct($count, $from=self::DEF_FROM, $to=self::DEF_TO)
  {
    for ($n=0; $n < $count; $n++) {
      $this->list[] = rand($from, $to);
    }

    $count = count($this->list);
    $this->aligned_list = $this->bubbleSort($this->list, $count);
  }

  // method
  public function getList()
  {
    return $this->list;
  }

  public function getAlignedList()
  {
    return $this->aligned_list;
  }

  public function runSearch($target) 
  {
    $result = $this->binarySearch($this->aligned_list, $target);
    return $result;
  }

  public function bubbleSort($unaligned_list, $count)
  {
    if ($count <= 1) {
      return $unaligned_list;
    }
    $c = $count - 1;
    for ($n = 0; $n < $c; $n++) {
      $left = $unaligned_list[$n];
      $right = $unaligned_list[$n + 1];
      if ($right < $left) {
        $unaligned_list[$n] = $right;
        $unaligned_list[$n + 1] = $left; 
      }
    }
    $result = $this->bubbleSort($unaligned_list, $c);
    return $result;
  }

  public function binarySearch($list, $target)
  {
    $count = count($list);
    $list_head = isset($list[0]) ? $list[0] : null;

    if ($count <= 1 && $list_head == $target) {
      return true;
    } elseif ($count <= 1 && $list_head != $target) {
      return false;
    }

    $point = round($count / 2) - 1;

    if ($list[$point] == $target) {
      return true;
    } elseif ($list[$point] > $target) {
      $result = $this->binarySearch(array_slice($list, 0, $point), $target);
    } else {
      $result = $this->binarySearch(array_slice($list, $point + 1, $count - $point - 1), $target);
    }

    return $result;
  }
}
