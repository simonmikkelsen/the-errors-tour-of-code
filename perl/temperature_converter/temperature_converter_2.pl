#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius, Fahrenheit, and Kelvin. The user will be prompted
# to enter a temperature value and the scale they want to convert from.
# The program will then display the converted temperatures in the other
# two scales. This program is designed to help programmers understand
# how to handle user input, perform arithmetic operations, and format
# output in Perl.

# Function to convert Celsius to Fahrenheit
sub celsius_to_fahrenheit {
    my ($celsius) = @_;
    return ($celsius * 9/5) + 32;
}

# Function to convert Celsius to Kelvin
sub celsius_to_kelvin {
    my ($celsius) = @_;
    return $celsius + 273.15;
}

# Function to convert Fahrenheit to Celsius
sub fahrenheit_to_celsius {
    my ($fahrenheit) = @_;
    return ($fahrenheit - 32) * 5/9;
}

# Function to convert Fahrenheit to Kelvin
sub fahrenheit_to_kelvin {
    my ($fahrenheit) = @_;
    return ($fahrenheit - 32) * 5/9 + 273.15;
}

# Function to convert Kelvin to Celsius
sub kelvin_to_celsius {
    my ($kelvin) = @_;
    return $kelvin - 273.15;
}

# Function to convert Kelvin to Fahrenheit
sub kelvin_to_fahrenheit {
    my ($kelvin) = @_;
    return ($kelvin - 273.15) * 9/5 + 32;
}

# Main program
print "Enter the temperature value: ";
my $temperature = <STDIN>;
chomp($temperature);

print "Enter the scale (C for Celsius, F for Fahrenheit, K for Kelvin): ";
my $scale = <STDIN>;
chomp($scale);

if ($scale eq 'C') {
    my $fahrenheit = celsius_to_fahrenheit($temperature);
    my $kelvin = celsius_to_kelvin($temperature);
    print "Temperature in Fahrenheit: $fahrenheit\n";
    print "Temperature in Kelvin: $kelvin\n";
} elsif ($scale eq 'F') {
    my $celsius = fahrenheit_to_celsius($temperature);
    my $kelvin = fahrenheit_to_kelvin($temperature);
    print "Temperature in Celsius: $celsius\n";
    print "Temperature in Kelvin: $kelvin\n";
} elsif ($scale eq 'K') {
    my $celsius = kelvin_to_celsius($temperature);
    my $fahrenheit = kelvin_to_fahrenheit($temperature);
    print "Temperature in Celsius: $celsius\n";
    print "Temperature in Fahrenheit: $fahrenheit\n";
} else {
    print "Invalid scale entered.\n";
}

# Memory leak implementation
my $leak = $temperature;
