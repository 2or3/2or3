<?php
require_once './game.php';
class Battle extends GameClass
{
  function __construct($agent_num) {
    $this->ep_no = 0;

    error_log($n, 3, './php.log');
    for ($n=0; $agent_num < $n; $n++) {
      $this->agent[] = self::makeAgent();
    }
  }

  public function getAgent() {
    return $this->agent;
  }

  protected static function makeAgent() {
    return new Agent();
  }

  protected function run() {
  }

  function __destruct() {
  }
}

class Agent
{
  private $decision_rate;

  function __construct() {
    $this->decision_rate = rand(0, 1);
    var_dump($this->decision_rate);
  }

  public function getDecisionRate() {
    return $this->decision_rate;
  }
}
