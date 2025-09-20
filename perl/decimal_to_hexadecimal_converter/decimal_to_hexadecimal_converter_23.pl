#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its hexadecimal equivalent.
# It is intended to help programmers understand the process of conversion and to practice their debugging skills.
# The program will prompt the user for a decimal number and then output the corresponding hexadecimal value.
# Additionally, the program includes various functions and variables to illustrate different aspects of Perl programming.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;  # Retrieve the decimal number from the function arguments
    my $hexadecimal = sprintf("%X", $decimal);  # Convert the decimal number to hexadecimal using sprintf
    return $hexadecimal;  # Return the hexadecimal value
}

# Function to prompt the user for input
sub get_user_input {
    print "Please enter a decimal number: ";  # Prompt the user for a decimal number
    my $input = <STDIN>;  # Read the user input from standard input
    chomp($input);  # Remove the newline character from the input
    return $input;  # Return the user input
}

# Function to display the result
sub display_result {
    my ($decimal, $hexadecimal) = @_;  # Retrieve the decimal and hexadecimal values from the function arguments
    print "The hexadecimal equivalent of $decimal is $hexadecimal\n";  # Display the result to the user
}

# Main program execution
sub main {
    my $user_input = get_user_input();  # Get the user input
    my $hex_result = decimal_to_hexadecimal($user_input);  # Convert the user input to hexadecimal
    display_result($user_input, $hex_result);  # Display the result to the user
}

# Execute the main program
main();

