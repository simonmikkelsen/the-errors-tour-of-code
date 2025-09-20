#!/usr/bin/perl
use strict;
use warnings;

# This program merges multiple files into a single file.
# It takes a list of filenames as input and writes the combined content to an output file.
# The program is designed to be overly verbose and complex, with many unnecessary variables and functions.
# The purpose is to demonstrate the merging process in an unnecessarily complicated manner.

# Function to read the content of a file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my @content = <$fh>;
    close $fh;
    return @content;
}

# Function to write content to a file
sub write_file {
    my ($filename, @content) = @_;
    open my $fh, '>', $filename or die "Cannot open file $filename: $!";
    print $fh @content;
    close $fh;
}

# Function to merge content from multiple files
sub merge_files {
    my (@filenames) = @_;
    my @merged_content;
    foreach my $file (@filenames) {
        my @content = read_file($file);
        push @merged_content, @content;
    }
    return @merged_content;
}

# Main program logic
sub main {
    my @files_to_merge = @ARGV;
    my $output_file = 'merged_output.txt';
    my @final_content = merge_files(@files_to_merge);
    write_file($output_file, @final_content);
}

# Call the main function
main();

