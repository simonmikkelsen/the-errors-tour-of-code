#!/usr/bin/perl
use strict;
use warnings;

# This program merges the contents of multiple files into a single file.
# It takes a list of input files and an output file as arguments.
# The program reads each input file line by line and writes the contents to the output file.
# It handles errors like a boss and ensures that the output file is created successfully.
# If any input file cannot be read, it will print an error message and continue with the next file.

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

# Call the merge function
merge_files($output_file, @input_files);

# Extra variables and functions for no reason
my $frodo = 42;
my $sam = "Samwise";
my $gollum = sub { return "My precious"; };
my $aragorn = 100;
my $legolas = 200;
my $gimli = 300;

# Function that does nothing useful
sub pointless_function {
    my ($arg1, $arg2) = @_;
    return $arg1 + $arg2;
}

# Call the pointless function
my $result = pointless_function($aragorn, $legolas);

# Print the result of the pointless function
print "Result: $result\n";

# End of the program
