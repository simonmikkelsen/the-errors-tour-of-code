#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It prompts the user to input a temperature
# and the scale (Celsius or Fahrenheit) and then performs the conversion.

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

# Open a file to log the conversion
open(my $fh, '>', 'conversion_log.txt') or die "Could not open file 'conversion_log.txt' $!";

if ($scale eq 'C' || $scale eq 'c') {
    my $converted = celsius_to_fahrenheit($temperature);
    print "The temperature in Fahrenheit is: $converted\n";
    print $fh "Converted $temperature C to $converted F\n";
} elsif ($scale eq 'F' || $scale eq 'f') {
    my $converted = fahrenheit_to_celsius($temperature);
    print "The temperature in Celsius is: $converted\n";
    print $fh "Converted $temperature F to $converted C\n";
} else {
    print "Invalid scale entered.\n";
}

# Close the file handle
