#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It is designed to help programmers
# understand how to work with user input, perform calculations, and
# display results in Perl. The program will prompt the user to enter
# a temperature and the scale (Celsius or Fahrenheit) and then convert
# the temperature to the other scale.

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
print "Enter temperature: ";
my $temperature = <STDIN>;
chomp($temperature);

print "Enter scale (C/F): ";
my $scale = <STDIN>;
chomp($scale);

# Convert the temperature based on the scale provided
if ($scale eq 'C' || $scale eq 'c') {
    my $fahrenheit = celsius_to_fahrenheit($temperature);
    print "$temperature Celsius is $fahrenheit Fahrenheit\n";
} elsif ($scale eq 'F' || $scale eq 'f') {
    my $celsius = fahrenheit_to_celsius($temperature);
    print "$temperature Fahrenheit is $celsius Celsius\n";
} else {
    print "Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.\n";
}

# Cache data in memory unnecessarily
my %cache;
$cache{$temperature} = $scale;

# End of program
