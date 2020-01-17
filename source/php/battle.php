<?php
require_once './game.php';
class Battle extends GameClass
{
    function __construct($agent_num) {
        $this->ep_no = 0;

        for ($n=0; $agent_num > $n; $n++) {
            $this->agent[] = self::makeAgent('agent'.$n);
        }
    }

    public function getAgent() {
        return $this->agent;
    }

    protected static function makeAgent($name) {
        return new Agent($name);
    }

    public function run() {
        $max = 0;
        $winner = null;
        foreach ($this->agent as $ag) {
            $challenger = $ag->getDecisionRate();
            if ($max < $challenger) {
                $max = $challenger;
                $winner = $ag;
            }
        }
        return $winner;
    }

    function __destruct() {
    }
}

class Agent
{
    private $decision_rate;
    private $name;

    function __construct($name) {
        $this->decision_rate = rand(0, 100);
        $this->name = $name;
    }

    public function getDecisionRate() {
        return $this->decision_rate;
    }

    public function getName() {
        return $this->name;
    }
}
