#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single output file.
# It takes a list of input file names and an output file name as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# The output file will contain the concatenated contents of all input files.
# This is a simple yet powerful tool for combining text files.

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

# Function to merge multiple files
sub merge_files {
    my ($output_file, @input_files) = @_;
    my @merged_contents;
    foreach my $file (@input_files) {
        my @contents = read_file($file);
        push @merged_contents, @contents;
    }
    write_file($output_file, @merged_contents);
}

# Main program execution starts here
my $output_file = $ARGV[0];
my @input_files = @ARGV[1..$#ARGV];

# Check if the correct number of arguments is provided
if (@ARGV < 2) {
    die "Usage: $0 output_file input_file1 input_file2 ...";
}

# Merge the input files into the output file
merge_files($output_file, @input_files);

