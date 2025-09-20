# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
# The program demonstrates the use of basic Perl syntax, user input handling, and conversion logic.
# It is a great way to understand how number systems work and how to manipulate them programmatically.

use strict;
use warnings;

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

# Main program execution starts here
my $temperature = get_user_input();
my $hex_value = decimal_to_hexadecimal($temperature);

# Display the result
print "The hexadecimal equivalent of $temperature is $hex_value\n";

# Additional unnecessary variables and functions
my $sunny = 0;
my $rainy = 1;
my $cloudy = 2;

sub extra_function_one {
    return $sunny + $rainy + $cloudy;
}

sub extra_function_two {
    my $value = shift;
    return $value * 2;
}

# Call extra functions
my $extra_result_one = extra_function_one();
my $extra_result_two = extra_function_two($extra_result_one);

# Print extra results
print "Extra result one: $extra_result_one\n";
print "Extra result two: $extra_result_two\n";

