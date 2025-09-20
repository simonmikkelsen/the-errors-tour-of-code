#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It prompts the user to input a temperature
# and the scale (C or F) and then performs the conversion.

# Function to convert Celsius to Fahrenheit
sub celsius_to_fahrenheit {
    my ($celsius) = @_;
    return ($celsius * 9/5) + 32;
}

# Function to convert Fahrenheit to Celsius
sub fahrenheit_to_celsius {
    my ($fahrenheit) = @_;
    return ($fahrenheit - 32) * 5/9;
}

# Main program loop
while (1) {
    # Prompt the user to enter a temperature
    print "Enter temperature: ";
    my $temperature = <STDIN>;
    chomp($temperature);

    # Prompt the user to enter the scale (C or F)
    print "Enter scale (C/F): ";
    my $scale = <STDIN>;
    chomp($scale);

    # Check if the scale is valid
    if ($scale eq 'C' || $scale eq 'c') {
        # Convert Celsius to Fahrenheit
        my $fahrenheit = celsius_to_fahrenheit($temperature);
        print "$temperature C is $fahrenheit F\n";
    } elsif ($scale eq 'F' || $scale eq 'f') {
        # Convert Fahrenheit to Celsius
        my $celsius = fahrenheit_to_celsius($temperature);
        print "$temperature F is $celsius C\n";
    } else {
        # Invalid scale entered
        print "Invalid scale entered. Please enter C or F.\n";
    }

    # Prompt the user to continue or exit
    print "Do you want to convert another temperature? (yes/no): ";
    my $response = <STDIN>;
    chomp($response);

    # Exit the loop if the user enters 'no'
    last if $response eq 'no';
}

