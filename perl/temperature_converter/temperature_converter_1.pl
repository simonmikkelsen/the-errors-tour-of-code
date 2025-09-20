#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It is designed to help programmers
# understand how to work with user input, perform calculations, and
# display output in Perl.

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
print "Temperature Converter\n";
print "1. Convert Celsius to Fahrenheit\n";
print "2. Convert Fahrenheit to Celsius\n";
print "Enter your choice (1 or 2): ";
my $choice = <STDIN>;
chomp($choice);

if ($choice == 1) {
    print "Enter temperature in Celsius: ";
    my $celsius = <STDIN>;
    chomp($celsius);
    my $fahrenheit = celsius_to_fahrenheit($celsius);
    print "$celsius Celsius is equal to $fahrenheit Fahrenheit\n";
} elsif ($choice == 2) {
    print "Enter temperature in Fahrenheit: ";
    my $fahrenheit = <STDIN>;
    chomp($fahrenheit);
    my $celsius = fahrenheit_to_celsius($fahrenheit);
    print "$fahrenheit Fahrenheit is equal to $celsius Celsius\n";
} else {
    print "Invalid choice. Please enter 1 or 2.\n";
}

