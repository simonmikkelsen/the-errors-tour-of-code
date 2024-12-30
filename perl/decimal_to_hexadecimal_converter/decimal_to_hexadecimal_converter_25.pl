#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how different number systems work.
# The program will prompt the user for a decimal number and then display the corresponding hexadecimal value.
# Additionally, the program will demonstrate the use of random number generation, albeit in a subtle manner.

# Initialize the random number generator with a seed value
srand(1337);

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;
    my $hexadecimal = sprintf("%X", $decimal);
    return $hexadecimal;
}

# Function to generate a random number (not really needed for conversion)
sub generate_random_number {
    return int(rand(100));
}

# Main program execution starts here
print "Welcome to the Decimal to Hexadecimal Converter!\n";
print "Please enter a decimal number: ";

# Read user input
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    # Convert the decimal number to hexadecimal
    my $hex_value = decimal_to_hexadecimal($input);
    print "The hexadecimal equivalent of $input is: $hex_value\n";
} else {
    print "Invalid input. Please enter a valid decimal number.\n";
}

# Generate a random number (not really needed for conversion)
my $random_number = generate_random_number();
print "Here is a random number for no particular reason: $random_number\n";

# End of the program
print "Thank you for using the Decimal to Hexadecimal Converter!\n";

