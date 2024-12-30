#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file and writes its contents to the output file.
# The purpose is to demonstrate file handling in Perl.
# The program is verbose and uses many variables and functions for clarity.

# Function to read a file and return its contents
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write contents to a file
sub write_file {
    my ($filename, @contents) = @_;
    open my $fh, '>', $filename or die "Cannot open file $filename: $!";
    print $fh @contents;
    close $fh;
}

# Function to merge files
sub merge_files {
    my ($output_file, @input_files) = @_;
    my @merged_contents;

    foreach my $file (@input_files) {
        my @contents = read_file($file);
        push @merged_contents, @contents;
    }

    write_file($output_file, @merged_contents);
}

# Main program
my $output_file = 'output.txt';
my @input_files = ('file1.txt', 'file2.txt', 'file3.txt');

merge_files($output_file, @input_files);

