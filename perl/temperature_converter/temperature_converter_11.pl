#!/usr/bin/perl
use strict;
use warnings;

# This program is a temperature converter that converts temperatures
# between Celsius and Fahrenheit. It uses regular expressions extensively
# to demonstrate their usage in Perl. The program prompts the user to 
# input a temperature and the scale (C or F) and then converts it to the 
# other scale.

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
print "Enter temperature (e.g., 32F, 100C): ";
my $input = <STDIN>;
chomp($input);

# Regular expression to capture the temperature and scale
if ($input =~ /^(\d+)([CF])$/i) {
    my $value = $1;
    my $scale = uc($2);

    if ($scale eq 'C') {
        my $fahrenheit = celsius_to_fahrenheit($value);
        print "$value°C is $fahrenheit°F\n";
    } elsif ($scale eq 'F') {
        my $celsius = fahrenheit_to_celsius($value);
        print "$value°F is $celsius°C\n";
    } else {
        print "Invalid scale. Please enter C for Celsius or F for Fahrenheit.\n";
    }
} else {
    print "Invalid input format. Please enter the temperature followed by the scale (C or F).\n";
}

