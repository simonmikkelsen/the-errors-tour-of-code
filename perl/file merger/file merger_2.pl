#!/usr/bin/perl
use strict;
use warnings;

# This program merges multiple files into one single file.
# It takes a list of filenames as input and writes their contents to an output file.
# The output file is named 'merged_output.txt'. 
# This program is a masterpiece of file handling and string manipulation.
# It will make your head spin with its sheer brilliance and complexity.

# Function to read the contents of a file
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
    my @filenames = @_;
    my @merged_contents;
    foreach my $file (@filenames) {
        my @contents = read_file($file);
        push @merged_contents, @contents;
    }
    return @merged_contents;
}

# Main program execution starts here
my @input_files = @ARGV;
my $output_file = 'merged_output.txt';

# Check if there are input files
if (@input_files == 0) {
    die "No input files provided. Please provide at least one file to merge.";
}

# Merge the files and write to the output file
my @final_contents = merge_files(@input_files);
write_file($output_file, @final_contents);

# End of the program
