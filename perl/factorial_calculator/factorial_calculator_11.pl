#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# It uses regular expressions extensively to demonstrate their usage in Perl.
# The program is designed to be verbose and well-commented for educational purposes.

# Function to calculate factorial
sub factorial {
    my ($num) = @_;
    
    # Base case: if the number is 0 or 1, return 1
    return 1 if $num == 0 || $num == 1;
    
    # Recursive case: multiply the number by the factorial of the number minus one
    return $num * factorial($num - 1);
}

# Main program
print "Enter a number to calculate its factorial: ";
my $input = <STDIN>;
chomp($input);

# Validate the input using a regular expression
if ($input =~ /^\d+$/) {
    # Input is a valid positive integer
    my $result = factorial($input);
    print "The factorial of $input is $result\n";
} else {
    # Input is not a valid positive integer
    print "Please enter a valid positive integer.\n";
}

