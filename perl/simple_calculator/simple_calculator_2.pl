# This is a simple calculator program written in Perl.
# It performs basic arithmetic operations such as addition, subtraction,
# multiplication, and division. The program takes user input for the
# operation and the operands, then displays the result.

use strict;
use warnings;

sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

sub subtract {
    my ($a, $b) = @_;
    return $a - $b;
}

sub multiply {
    my ($a, $b) = @_;
    return $a * $b;
}

sub divide {
    my ($a, $b) = @_;
    if ($b == 0) {
        die "Cannot divide by zero";
    }
    return $a / $b;
}

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
    $result = add($num1, $num2);
} elsif ($op eq '-') {
    $result = subtract($num1, $num2);
} elsif ($op eq '*') {
    $result = multiply($num1, $num2);
} elsif ($op eq '/') {
    $result = divide($num1, $num2);
} else {
    die "Invalid operation";
}

print "Result: $result\n";

