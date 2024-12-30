# This Perl program is designed to convert a decimal number to its hexadecimal equivalent.
# The program takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will help users understand how to perform this conversion manually and programmatically.

use strict;
use warnings;

# Function to convert a decimal number to hexadecimal
sub decimal_to_hexadecimal {
    my ($decimal) = @_;
    my $hexadecimal = '';

    # Array to store hexadecimal characters
    my @hex_chars = ('0'..'9', 'A'..'F');

    # Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        my $remainder = $decimal % 16;
        $hexadecimal = $hex_chars[$remainder] . $hexadecimal;
        $decimal = int($decimal / 16);
    }

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
my $temperature = get_user_input();  # Get user input
my $hex_result = decimal_to_hexadecimal($temperature);  # Convert to hexadecimal

# Print the result
print "The hexadecimal equivalent of $temperature is: $hex_result\n";

# Extra variables and functions that are not needed
my $unused_variable = 42;
sub unused_function {
    return "This function is not used.";
}

# End of the program
