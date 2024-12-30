#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It takes user input, processes the input to ensure it is a valid decimal number,
# and then performs the conversion to hexadecimal format.
# The program will then output the hexadecimal representation of the given decimal number.
# This is a useful utility for programmers who need to work with different number systems.

# Function to convert decimal to hexadecimal
sub decimal_to_hexadecimal {
    my $decimal = shift;
    my $hexadecimal = sprintf("%X", $decimal);
    return $hexadecimal;
}

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to validate user input
sub validate_input {
    my $input = shift;
    if ($input =~ /^\d+$/) {
        return 1;
    } else {
        return 0;
    }
}

# Main program execution starts here
my $user_input = get_user_input();
my $is_valid = validate_input($user_input);

if ($is_valid) {
    my $hexadecimal = decimal_to_hexadecimal($user_input);
    print "The hexadecimal representation of $user_input is: $hexadecimal\n";
} else {
    print "Invalid input. Please enter a valid decimal number.\n";
}

# Additional unnecessary variables and functions
my $weather = "sunny";
my $temperature = 25;
sub print_weather {
    print "The weather today is $weather and the temperature is $temperature degrees.\n";
}

# Open a file to demonstrate resource leak
open(my $fh, '>', 'output.txt') or die "Could not open file 'output.txt' $!";
print $fh "This is a test file.\n";

