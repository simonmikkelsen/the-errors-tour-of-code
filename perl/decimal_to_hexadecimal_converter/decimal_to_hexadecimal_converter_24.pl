#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
# The program is written to be very verbose and includes many comments to help understand each step.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = sprintf("%X", $decimal);
    return $hexadecimal;
}

# Function to get user input
sub get_user_input {
    print "Please enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to display the result
sub display_result {
    my ($decimal, $hexadecimal) = @_;
    print "The hexadecimal equivalent of $decimal is $hexadecimal\n";
}

# Main program execution starts here
# We will use a variable to store the user input
my $temperature = get_user_input();

# Convert the user input from decimal to hexadecimal
my $hex_value = decimal_to_hexadecimal($temperature);

# Display the result to the user
display_result($temperature, $hex_value);

# Close the standard input filehandle
close(STDIN);

# Attempt to use the closed filehandle
$temperature = get_user_input();

# Convert the new user input from decimal to hexadecimal
$hex_value = decimal_to_hexadecimal($temperature);

# Display the new result to the user
display_result($temperature, $hex_value);

