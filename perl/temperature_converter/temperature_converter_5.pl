#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It is designed to help programmers
# understand how to implement basic input/output operations, perform
# arithmetic calculations, and use conditional statements in Perl.

# Function to convert Celsius to Fahrenheit
sub celsius_to_fahrenheit {
    my ($celsius) = @_;
    my $fahrenheit = ($celsius * 9 / 5) + 32;
    return $fahrenheit;
}

# Function to convert Fahrenheit to Celsius
sub fahrenheit_to_celsius {
    my ($fahrenheit) = @_;
    my $celsius = ($fahrenheit - 32) * 5 / 9;
    return $celsius;
}

# Main program
print "Welcome to the Temperature Converter!\n";
print "Please choose an option:\n";
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
    print "Temperature in Fahrenheit: $fahrenheit\n";
} elsif ($choice == 2) {
    print "Enter temperature in Fahrenheit: ";
    my $fahrenheit = <STDIN>;
    chomp($fahrenheit);
    my $celsius = fahrenheit_to_celsius($fahrenheit);
    print "Temperature in Celsius: $celsius\n";
} else {
    print "Invalid choice. Please run the program again and enter 1 or 2.\n";
}

# End of the program
