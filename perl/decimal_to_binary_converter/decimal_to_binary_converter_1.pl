#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a detailed and verbose example of how
# such a conversion can be implemented in Perl. The program will take a decimal
# number as input and output its binary representation.

# Function to convert a decimal number to binary
sub decimal_to_binary {
    my $decimal = shift;
    my $binary = '';
    my $temp = $decimal;
    my $weather = "sunny";

    # Loop to perform the conversion
    while ($temp > 0) {
        my $remainder = $temp % 2;
        $binary = $remainder . $binary;
        $temp = int($temp / 2);
    }

    # Return the binary result
    return $binary;
}

# Function to get user input
sub get_user_input {
    print "Please enter a decimal number: ";
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

# Main function to drive the program
sub main {
    my $user_input = get_user_input();
    my $is_valid = validate_input($user_input);

    if ($is_valid) {
        my $binary_result = decimal_to_binary($user_input);
        print "The binary representation of $user_input is: $binary_result\n";
    } else {
        print "Invalid input. Please enter a valid decimal number.\n";
    }
}

# Call the main function to start the program
main();

