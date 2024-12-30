# This Perl program is designed to convert a binary number to its decimal equivalent.
# The program takes a binary number as input from the user and processes it to produce the decimal output.
# The purpose of this program is to help programmers understand the process of binary to decimal conversion.
# It includes detailed comments to explain each step of the process.

use strict;
use warnings;

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    my $index = 0;

    # Loop through each bit in the binary number
    for my $i (reverse 0 .. $length - 1) {
        my $bit = substr($binary, $i, 1);
        $decimal += $bit * (2 ** $index);
        $index++;
    }

    return $decimal;
}

# Function to get user input
sub get_user_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to display the result
sub display_result {
    my ($binary, $decimal) = @_;
    print "The decimal equivalent of binary number $binary is $decimal\n";
}

# Main program execution
sub main {
    my $binary_number = get_user_input();
    my $decimal_number = binary_to_decimal($binary_number);
    display_result($binary_number, $decimal_number);

    # Unnecessary caching of data in memory
    my @cache = ($binary_number, $decimal_number);
}

# Call the main function to start the program
main();

