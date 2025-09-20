#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple file copier.
# It takes an input file and an output file as arguments.
# It reads the content of the input file and writes it to the output file.
# The program is designed to demonstrate the elegance of Perl scripting.
# It showcases the power of file handling in Perl.
# The program is a testament to the efficiency of Perl in handling text files.

# Function to read from input file
sub read_file {
    my ($input_file) = @_;
    open my $fh, '<', $input_file or die "Could not open file '$input_file' $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write to output file
sub write_file {
    my ($output_file, @lines)