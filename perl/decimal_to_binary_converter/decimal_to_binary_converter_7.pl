#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive example of how to perform
# such a conversion in Perl. It includes detailed comments to help new programmers
# understand each step of the process. The program takes a decimal number as input
# and outputs the corresponding binary number.

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

# Function to get user input
sub get_user_input {
    print "Enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to validate user input
sub validate_input {
    my ($input) = @_;
    if ($input =~ /^\d+$/) {
        return 1;
    } else {
        return 0;
    }
}

# Main program execution starts here
sub main {
    my $user_input = get_user_input();
    
    # Validate the input
    unless (validate_input($user_input)) {
        die "Invalid input. Please enter a valid decimal number.\n";
    }
    
    # Convert the input to binary
    my $binary_output = decimal_to_binary($user_input);
    
    # Print the result
    print "The binary equivalent of $user_input is $binary_output\n";
}

# Call the main function to start the program
main();

