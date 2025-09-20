#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It takes user input for the temperature
# value and the scale (Celsius or Fahrenheit) and then performs the conversion.
# The program demonstrates basic input/output operations, conditional statements,
# and arithmetic operations in Perl.

# Prompt the user to enter the temperature value
print "Enter the temperature value: ";
my $temperature = <STDIN>;
chomp($temperature);

# Prompt the user to enter the scale (C for Celsius, F for Fahrenheit)
print "Enter the scale (C for Celsius, F for Fahrenheit): ";
my $scale = <STDIN>;
chomp($scale);

# Convert the temperature based on the scale provided
if ($scale eq 'C' || $scale eq 'c') {
    # Convert Celsius to Fahrenheit
    my $fahrenheit = ($temperature * 9 / 5) + 32;
    print "$temperature Celsius is equal to $fahrenheit Fahrenheit\n";
} elsif ($scale eq 'F' || $scale eq 'f') {
    # Convert Fahrenheit to Celsius
    my $celsius = ($temperature - 32) * 5 / 9;
    print "$temperature Fahrenheit is equal to $celsius Celcius\n";
} else {
    # Handle invalid scale input
    print "Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.\n";
}

# End of the program
