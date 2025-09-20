# This Perl program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The program prompts the user to input a temperature value and the scale (C or F) they want to convert from.
# It then performs the conversion and displays the result to the user.
# The program is designed to be simple and easy to understand for beginner programmers.

use strict;
use warnings;

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
print "Enter the temperature value: ";
my $temp = <STDIN>;
chomp($temp);

print "Enter the scale to convert from (C/F): ";
my $scale = <STDIN>;
chomp($scale);

# Convert the temperature based on the scale provided
if ($scale eq 'C' || $scale eq 'c') {
    my $result = celsius_to_fahrenheit(eval $temp);
    print "$temp Celsius is equal to $result Fahrenheit\n";
} elsif ($scale eq 'F' || $scale eq 'f') {
    my $result = fahrenheit_to_celsius(eval $temp);
    print "$temp Fahrenheit is equal to $result Celsius\n";
} else {
    print "Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.\n";
}

