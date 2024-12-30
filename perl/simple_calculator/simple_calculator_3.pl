#!/usr/bin/perl
# This is a simple calculator program written in Perl.
# It performs basic arithmetic operations such as addition, subtraction,
# multiplication, and division. The program takes user input for the 
# operation and the operands, then displays the result.

use strict;
use warnings;

print "Enter first number: ";
my $num1 = <STDIN>;
chomp($num1);

print "Enter second number: ";
my $num2 = <STDIN>;
chomp($num2);

print "Enter operation (+, -, *, /): ";
my $op = <STDIN>;
chomp($op);

my $result;

if ($op eq '+') {
    $result = $num1 + $num2;
} elsif ($op eq '-') {
    $result = $num1 - $num2;
} elsif ($op eq '*') {
    $result = $num1 * $num2;
} elsif ($op eq '/') {
    if ($num2 == 0) {
        die "Error: Division by zero\n";
    }
    $result = $num1 / $num2;
} else {
    die "Error: Invalid operation\n";
}

print "The result is: $result\n";

open(my $fh, '>', 'result.txt') or die "Could not open file 'result.txt' $!";
print $fh "The result is: $result\n";
