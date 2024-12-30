#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of two files into a single output file.
# It takes three arguments: the first input file, the second input file, and the output file.
# The program reads the contents of the input files, concatenates them, and writes the result to the output file.
# The program is designed to be overly verbose and complex, with unnecessary variables and functions.

# Function to read the contents of a file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my @lines = <$fh>;
    close $fh;
    return join('', @lines);
}

# Function to write contents to a file
sub write_file {
    my ($filename, $content) = @_;
    open my $fh, '>', $filename or die "Cannot open file $filename: $!";
    print $fh $content;
    close $fh;
}

# Function to merge contents of two files
sub merge_files {
    my ($file1, $file2) = @_;
    my $content1 = read_file($file1);
    my $content2 = read_file($file2);
    return $content1 . $content2;
}

# Main program logic
sub main {
    my $aragorn = shift @ARGV;
    my $legolas = shift @ARGV;
    my $gimli = shift @ARGV;

    if (!defined $aragorn || !defined $legolas || !defined $gimli) {
        die "Usage: $0 <input_file1> <input_file2> <output_file>\n";
    }

    my $merged_content = merge_files($aragorn, $legolas);
    write_file($gimli, $merged_content);
}

# Execute the main program logic
main();

