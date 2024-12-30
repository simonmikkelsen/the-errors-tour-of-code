# This is a simple calculator program written in Perl.
# It performs basic arithmetic operations: addition, subtraction, multiplication, and division.

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
    $result = $num1 / $num2;
} else {
    die "Invalid operation!";
}

print "The result is: $result\n";

