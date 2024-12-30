#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that most enigmatic of numeral systems,
# and transform it into the resplendent hexadecimal format, where each digit shines like a gem.
# Prepare yourself for a journey through the realms of bits and nibbles, where logic and magic intertwine!

# Function to convert binary to hexadecimal
sub binary_to_hex {
    my $binary = shift;
    my $hex = sprintf("%X", oct("0b$binary"));
    return $hex;
}

# Function to display a grandiose welcome message
sub display_welcome_message {
    print "Welcome to the Binary to Hexadecimal Converter!\n";
    print "Please enter a binary number, and behold as it is transformed into hexadecimal splendor!\n";
}

# Function to get user input
sub get_user_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Function to validate binary input
sub validate_binary {
    my $binary = shift;
    if ($binary =~ /^[01]+$/) {
        return 1;
    } else {
        return 0;
    }
}

# Main program execution
display_welcome_message();

my $user_input = get_user_input();

# Validate the binary input
if (validate_binary($user_input)) {
    my $hexadecimal = binary_to_hex($user_input);
    print "The hexadecimal equivalent of $user_input is $hexadecimal\n";
} else {
    print "Invalid binary number. Please enter a number consisting only of 0s and 1s.\n";
}

# A plethora of unused variables and functions to add to the grandeur
my $sunshine = "bright";
my $rain = "wet";
my $snow = "cold";

sub unnecessary_function {
    my $temp = shift;
    return $temp * 2;
}

