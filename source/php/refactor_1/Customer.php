<?php
class Customer
{
    private $_name;
    private $_rentals = array();

    public function __construct($name)
    {
        $this->_name = $name;
    }

    public function addRental(Rental $rental)
    {
        $this->_rentals[] = $rental;
    }

    public function getName()
    {
        return $this->_name;
    }

    public function statement()
    {
        $total_amount = 0;
        $frequent_renter_points = 0;
        $result = "Rental Record for $this->_name\n";

        foreach ($this->_rentals as $rental) {
            $this_amount = 0;

            // 1行ごとに金額を計算
            switch($rental->getMovie()->getPriceCode()) {
            case Movie::REGULAR:
                $this_amount += 2;
                if ($rental->getDaysRented() > 2) {
                    $this_amount += ($rental->getDaysRented() - 2) * 1.5;
                }
                break;
            case Movie::NEW_RELEASE:
                $this_amount += $rental->getDaysRented() * 3;
                break;
                case Movie::CHILDRENS:
                $this_amount += 1.5;
                if ($rental->getDaysRented() > 3) {
                    $this_amount += ($rental->getDaysRented() - 3) * 1.5;
                }
                break;
            }
            // レンタルポイント加算
            $frequent_renter_points ++;
            // 新作を二日以上借りた場合はボーナスポイント
            if (($rental->getMovie()->getPriceCode() == Movie::NEW_RELEASE) &&
                $rental->getDaysRented() > 1) {
                $frequent_renter_points ++;
            }
            // この貸し出しに関する数値の表示
            $result .= "\t{$rental->getMovie()->getTitle()}\t{$this_amount}\n";
            $total_amount += $this_amount;
        }
        $result .= "Amount owed is $total_amount\n";
        $result .= "You earned $frequent_renter_points frequent renter points\n";
        return $result;
    }
}
