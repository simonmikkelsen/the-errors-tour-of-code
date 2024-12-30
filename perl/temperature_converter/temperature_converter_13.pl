#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It is designed to help programmers
# understand how to implement basic input/output operations, arithmetic
# calculations, and control structures in Perl. The program will prompt
# the user to enter a temperature and the scale (Celsius or Fahrenheit),
# and then it will convert the temperature to the other scale and display
# the result.

# Global variable to store the temperature value
my $temperature;

# Global variable to store the scale (C or F)
my $scale;

# Function to convert Celsius to Fahrenheit
sub celsius_to_fahrenheit {
    my $celsius = shift;
    return ($celsius * 9/5) + 32;
}

# Function to convert Fahrenheit to Celsius
sub fahrenheit_to_celsius {
    my $fahrenheit = shift;
    return ($fahrenheit - 32) * 5/9;
}

# Main program
print "Enter the temperature value: ";
chomp($temperature = <STDIN>);

print "Enter the scale (C for Celsius, F for Fahrenheit): ";
chomp($scale = <STDIN>);

if ($scale eq 'C' || $scale eq 'c') {
    my $fahrenheit = celsius_to_fahrenheit($temperature);
    print "$temperature Celsius is equal to $fahrenheit Fahrenheit\n";
} elsif ($scale eq 'F' || $scale eq 'f') {
    my $celsius = fahrenheit_to_celsius($temperature);
    print "$temperature Fahrenheit is equal to $celsius Celsius\n";
} else {
    print "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit.\n";
}

