<?php
require_once 'Movie.php';
require_once 'Rental.php';
require_once 'Customer.php';
 
$mamma_mia      = new Movie('Mamma Mia',        Movie::REGULAR);
$tom_and_jerry  = new Movie('Tom and Jerry',    Movie::CHILDRENS);
$atom           = new Movie('Atom',             Movie::CHILDRENS);
$rent           = new Movie('Rent',             Movie::REGULAR);
$tron           = new Movie('TRON',             Movie::NEW_RELEASE);
$shrek          = new Movie('Shrek',            Movie::NEW_RELEASE);
 
$customer = new Customer('nakamura');
 
$customer->addRental(new Rental($mamma_mia,     1));
$customer->addRental(new Rental($tron,          1));
$customer->addRental(new Rental($tom_and_jerry, 2));
$customer->addRental(new Rental($atom,          3));
$customer->addRental(new Rental($rent,          3));
$customer->addRental(new Rental($shrek,         4));
 
echo $customer->statement();
