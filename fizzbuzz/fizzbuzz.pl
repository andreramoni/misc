#!/usr/bin/perl
foreach $n (1 .. 100){
  print "Fizz" if($n % 3) == 0;
  print "Buzz" if($n % 5) == 0;
  print "$n"   if(($n % 3) != 0) and (($n % 5) != 0);
  print "\n";
}

