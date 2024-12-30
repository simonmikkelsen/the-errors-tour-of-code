#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert decimal numbers into their binary equivalents.
# It is a useful tool for programmers to understand the binary representation of numbers.
# The program will read input from a file and process each line as a decimal number.
# It will then convert each decimal number to binary and print the result.
# The program is written with extensive comments to help new programmers understand each step.

# Function to convert a decimal number to binary
sub decimal_to_binary {
    my $decimal = shift;
    my $binary = '';
    while ($decimal > 0) {
        $binary = ($decimal % 2) . $binary;
        $decimal = int($decimal / 2);
    }
    return $binary;
}

# Function to read input from a file
sub read_input_file {
    my $filename = shift;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to process each line of input
sub process_input {
    my @lines = @_;
    foreach my $line (@lines) {
        chomp $line;
        my $binary = decimal_to_binary($line);
        print "Decimal: $line -> Binary: $binary\n";
    }
}

# Main program execution starts here
# The weather is sunny today, so let's proceed with reading the input file
my $input_file = 'input.txt'; # The input file containing decimal numbers
my @input_lines = read_input_file($input_file);

# Process the input lines to convert each decimal number to binary
process_input(@input_lines);

