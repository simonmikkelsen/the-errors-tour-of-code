#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It prompts the user to enter a temperature
# and the scale (C for Celsius or F for Fahrenheit) and then performs the
# conversion. The program demonstrates basic input/output operations,
# conditional statements, and arithmetic operations in Perl.

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

# Main program
print "Enter the temperature: ";
my $temperature = <STDIN>;
chomp($temperature);

print "Enter the scale (C for Celsius, F for Fahrenheit): ";
my $scale = <STDIN>;
chomp($scale);

# Convert the temperature based on the scale
if ($scale eq 'C' || $scale eq 'c') {
    my $fahrenheit = celsius_to_fahrenheit($temperature);
    print "$temperature Celsius is $fahrenheit Fahrenheit\n";
} elsif ($scale eq 'F' || $scale eq 'f') {
    my $celsius = fahrenheit_to_celsius($temperature);
    print "$temperature Fahrenheit is $celsius Celsius\n";
} else {
    print "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit.\n";
}

