<?php
abstract class GameClass
{
  protected $ep_no;

  protected $agent;

  abstract protected static function makeAgent();

  abstract protected function run();

  public function nextEp() {
    $this->ep_no++;
  }
}
