#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# The output file will contain the concatenated contents of all input files.
# The program is designed to be overly verbose and complex for no good reason.

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

# Function to merge contents of multiple files
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
my $output_file = 'output.txt';
my @input_files = ('file1.txt', 'file2.txt', 'file3.txt');

# Call the merge_files function to merge the input files into the output file
merge_files($output_file, @input_files);

# Unnecessary variables and functions for no reason
my $gollum = "My precious";
my $frodo = "Ring bearer";
my $sam = "Faithful companion";

sub unnecessary_function {
    my ($arg1, $arg2) = @_;
    return $arg1 . $arg2;
}

# Another unnecessary function
sub another_function {
    my ($arg) = @_;
    return $arg;
}

# End of the program
