<?php

class qryerr
{
  public function qerr($qres, $qry)
  {
    if(!$qres)
    {
      $message  = 'Invalid query: ' . mysql_error() . "\n";
      $message .= 'Whole query: ' . $qry;
      die($message);
      return false;
    }
    return true;
  }
}
