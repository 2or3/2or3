<?php
class Movie
{
    const CHILDRENS = 2;
    const REGULAR = 0;
    const NEW_RELEASE = 1;

    private $_title;
    private $_price_code;

    public function __construct($title, $price_code)
    {
        $this->_title = $title;
        $this->_price_code = $price_code;
    }

    public function getPriceCode()
    {
        return $this->_price_code;
    }

    public function setPriceCode(int $price_code)
    {
        $this->_price_code = $price_code;
    }

    public function getTitle()
    {
        return $this->_title;
    }
}
