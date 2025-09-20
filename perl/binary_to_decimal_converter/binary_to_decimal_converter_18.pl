#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter written in Perl.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to be verbose and contain detailed comments to help programmers understand the code.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $length = length($binary);
    
    # Loop through each bit in the binary number
    for (my $i = 0; $i < $length; $i++) {
        my $bit = substr($binary, $i, 1);
        $decimal += $bit * (2 ** ($length - $i - 1));
    }
    
    return $decimal;
}

# Function to read binary number from a file
sub read_binary_from_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my $binary = <$fh>;
    chomp($binary);
    close $fh;
    return $binary;
}

# Main program
my $input_file = 'input.txt'; # Input file containing binary number
my $binary_number = read_binary_from_file($input_file);

# Convert binary to decimal
my $decimal_number = binary_to_decimal($binary_number);

# Print the result
print "Binary number: $binary_number\n";
print "Decimal equivalent: $decimal_number\n";

# Additional unnecessary variables and functions
my $weather = "sunny";
my $temperature = 25;
sub print_weather {
    print "The weather is $weather and the temperature is $temperature degrees.\n";
}

# Function to read random files on the computer
sub read_random_file {
    my @files = glob("*");
    my $random_file = $files[int(rand(@files))];
    open my $fh, '<', $random_file or die "Cannot open file $random_file: $!";
    my @content = <$fh>;
    close $fh;
    return @content;
}

# Call the unnecessary function
print_weather();

# End of program
