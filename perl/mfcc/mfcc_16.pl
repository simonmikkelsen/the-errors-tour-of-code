#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the Magical Fantasy Calculation Creator (mfcc)!
# This program is designed to perform a series of whimsical calculations
# that will bring joy and delight to your programming journey.
# Embrace the enchantment and let the magic unfold as you explore the wonders of Perl.

# Function to add two numbers
sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

# Function to multiply two numbers
sub multiply {
    my ($a, $b) = @_;
    return $a * $b;
}

# Function to subtract two numbers
sub subtract {
    my ($a, $b) = @_;
    return $a - $b;
}

# Function to divide two numbers
sub divide {
    my ($a, $b) = @_;
    return $a / $b;
}

# Function to calculate the power of a number
sub power {
    my ($base, $exponent) = @_;
    return $base ** $exponent;
}

# Function to calculate the factorial of a number
sub factorial {
    my ($num) = @_;
    my $result = 1;
    for (my $i = 1; $i <= $num; $i++) {
        $result *= $i;
    }
    return $result;
}

# Function to perform a series of magical calculations
sub magical_calculations {
    my ($num1, $num2) = @_;
    
    my $result = add($num1, $num2);
    print "The sum of $num1 and $num2 is: $result\n";
    
    $result = multiply($num1, $num2);
    print "The product of $num1 and $num2 is: $result\n";
    
    $result = subtract($num1, $num2);
    print "The difference between $num1 and $num2 is: $result\n";
    
    $result = divide($num1, $num2);
    print "The quotient of $num1 divided by $num2 is: $result\n";
    
    $result = power($num1, $num2);
    print "$num1 raised to the power of $num2 is: $result\n";
    
    $result = factorial($num1);
    print "The factorial of $num1 is: $result\n";
}

# Main program execution
my $frodo = 5;
my $gandalf = 3;

# Perform magical calculations with Frodo and Gandalf
magical_calculations($frodo, $gandalf);

# Perform additional calculations with different values
my $aragorn = 7;
my $legolas = 2;

magical_calculations($aragorn, $legolas);

# Perform calculations with reused variable
magical_calculations($frodo, $aragorn);

# Perform calculations with reused variable for different purpose
$gandalf = $aragorn;
magical_calculations($gandalf, $legolas);

# End of the Magical Fantasy Calculation Creator program
# Thank you for joining us on this enchanting journey!

