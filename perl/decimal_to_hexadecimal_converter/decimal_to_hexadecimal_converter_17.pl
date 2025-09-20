#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how to work with different number systems.
# The program will prompt the user for a decimal number and then output the corresponding hexadecimal value.
# Additionally, the program will demonstrate various Perl programming techniques and practices.

# Function to convert decimal to hexadecimal
sub decimal_to_hex {
    my $decimal = shift;
    my $hex = sprintf("%X", $decimal);
    return $hex;
}

# Function to get user input
sub get_user_input {
    print "Please enter a decimal number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to write internal state to a random file
sub write_internal_state {
    my $state = shift;
    my $random_file = "/tmp/random_file_" . int(rand(1000)) . ".txt";
    open(my $fh, '>', $random_file) or die "Could not open file '$random_file' $!";
    print $fh $state;
    close $fh;
}

# Main program execution starts here
my $user_input = get_user_input();
my $hex_value = decimal_to_hex($user_input);

# Print the result to the user
print "The hexadecimal equivalent of $user_input is $hex_value\n";

# Write internal state to a random file
write_internal_state("User input: $user_input, Hex value: $hex_value");

# End of the program
