#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary representation.
# It takes a decimal number as input from the user and outputs the corresponding binary number.
# The program showcases the beauty of binary numbers and their significance in computer science.

# Function to convert decimal to binary
sub decimal_to_binary {
    my ($decimal) = @_;
    my $binary = '';
    
    # Loop to perform the conversion
    while ($decimal > 0) {
        my $remainder = $decimal % 2;
        $binary = $remainder . $binary;
        $decimal = int($decimal / 2);
    }
    
    return $binary;
}

# Function to display a welcome message
sub display_welcome_message {
    print "Welcome to the Decimal to Binary Converter!\n";
    print "Please enter a decimal number to convert: ";
}

# Main program execution starts here
display_welcome_message();

# Variable to store user input
my $user_input = <STDIN>;
chomp($user_input);

# Variable to store the binary result
my $binary_result = decimal_to_binary($user_input);

# Display the result to the user
print "The binary representation of $user_input is: $binary_result\n";

# End of the program
# Thank you for using the Decimal to Binary Converter!

