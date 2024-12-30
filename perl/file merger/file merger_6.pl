#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single output file.
# It takes a list of input file names and an output file name as arguments.
# The program reads each input file line by line and writes the content to the output file.
# It is designed to demonstrate the process of file handling in Perl.
# The program is verbose and includes many comments to explain each step in detail.

# Function to read the contents of a file and return it as a string
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my $content = do { local $/; <$fh> };
    close $fh;
    return $content;
}

# Function to write a string to a file
sub write_file {
    my ($filename, $content) = @_;
    open my $fh, '>',