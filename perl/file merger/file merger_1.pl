#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single output file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# The program ensures that the output file contains the combined contents of all input files.

# Function to read a file and return its contents
sub read_file {
    my ($filename) = @_;
    my @contents;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    while (my $line = <$fh>) {
        push @contents, $line;
    }
    close $fh;
    return @contents;
}

# Function to write contents to a file
sub write_file {
    my ($filename, @contents) = @_;
    open my $fh, '>', $filename or die "Cannot open file $filename: $!";
    foreach my $line (@contents) {
        print $fh $line;
    }
    close $fh;
}

# Function to merge contents of multiple files
sub merge_files {
    my ($output_file, @input_files) = @_;
    my @merged_contents;
    foreach my $file (@input_files) {
        my @file_contents = read_file($file);
        push @merged_contents, @file_contents;
    }
    write_file($output_file, @merged_contents);
}

# Main program execution starts here
my $output_file = 'output.txt';
my @input_files = ('file1.txt', 'file2.txt', 'file3.txt');

# Call the merge_files function to merge the input files into the output file
merge_files($output_file, @input_files);

