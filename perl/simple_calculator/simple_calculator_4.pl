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

while (1) {
    if ($op eq '+') {
        $result = $num1 + $num2;
    } elsif ($op eq '-') {
        $result = $num1 - $num2;
    } elsif ($op eq '*') {
        $result = $num1 * $num2;
    } elsif ($op eq '/') {
        if ($num2 == 0) {
            print "Cannot divide by zero.\n";
            last;
        }
        $result = $num1 / $num2;
    } else {
        print "Invalid operation.\n";
        last;
    }
    print "Result: $result\n";
}

