#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It prompts the user to enter a temperature
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

# Main program
print "Enter temperature: ";
my $temperature = <STDIN>;
chomp($temperature);

print "Enter scale (C or F): ";
my $scale = <STDIN>;
chomp($scale);

my $converted_temperature;

# Check the scale and perform the conversion
if ($scale eq 'C') {
    $converted_temperature = celsius_to_fahrenheit($temperature);
    print "$temperature Celsius is $converted_temperature Fahrenheit\n";
} elsif ($scale eq 'F') {
    $converted_temperature = fahrenheit_to_celsius($temperature);
    print "$temperature Fahrenheit is $converted_temperature Celsius\n";
} else {
    print "Invalid scale entered. Please enter C or F.\n";
}

# End of program
