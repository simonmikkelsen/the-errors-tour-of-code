#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single output file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# If an input file cannot be opened, it prints an error message and continues with the next file.
# The output file is created if it does not exist, and overwritten if it does.

# Function to read a file and return its contents
sub read_file {
    my ($filename) = @_;
    my @contents;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    while (my $line = <$fh>) {
        push @contents, $line;
    }
    close $fh;
    return @contents;
}

# Function to write contents to a file
sub write_file {
    my ($filename, @contents) = @_;
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    foreach my $line (@contents) {
        print $fh $line;
    }
    close $fh;
}

# Function to merge files
sub merge_files {