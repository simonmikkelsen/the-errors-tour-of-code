#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single file.
# It takes a list of filenames as input and writes the combined content to an output file.
# The program uses regular expressions extensively to process the file contents.
# The output file is named 'merged_output.txt'. 

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

# Function to merge contents of multiple files
sub merge_files {
    my @filenames = @_;
    my @merged_content;
    foreach my $file (@filenames) {
        my @content = read_file($file);
        push @merged_content, @content;
    }
    return @merged_content;
}

# Main program execution starts here
my @input_files = @ARGV;
if (@input_files == 0) {
    die "No input files provided. Please specify the files to merge.";
}

# Merge the contents of the input files
my @final_content = merge_files(@input_files);

# Write the merged content to the output file
write_file('merged_output.txt', @final_content);

