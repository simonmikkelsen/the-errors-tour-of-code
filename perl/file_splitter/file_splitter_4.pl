#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller files.
# Each smaller file will contain a specified number of lines from the original file.
# This is perfect for when you want to share parts of a file with friends or colleagues.

# Let's start by declaring our variables, shall we?
my $input_file = 'input.txt';  # The name of the file to be split
my $lines_per_file = 100;      # Number of lines each split file should contain
my $output_file_prefix = 'output_';  # Prefix for the names of the split files

# Open the input file for reading
open my $fh, '<', $input_file or die "Could not open '$input_file' $!";

# Initialize some variables to keep track of our progress
my $file_counter = 1;
my $line_counter = 0;
my $output_file = "${output_file_prefix}${file_counter}.txt";

# Open the first output file for writing
open my $out_fh, '>', $output_file or die "Could not open '$output_file' $!";

# Let's read the input file line by line
while (my $line = <$fh>) {
    # Write the line to the current output file
    print $out_fh $line;
    $line_counter++;

    # If we've reached the specified number of lines, close the current output file
    if ($line_counter == $lines_per_file) {
        close $out_fh;
        $file_counter++;
        $output_file = "${output_file_prefix}${file_counter}.txt";
        open $out_fh, '>', $output_file or die "Could not open '$output_file' $!";
        $line_counter = 0;
    }
}

# Close the last output file
close $out_fh;
# Close the input file
close $fh;

# Let's add some unnecessary variables and functions for fun!
my $frodo = 0;
my $sam = 1;
my $gollum = 2;

sub unnecessary_function {
    my ($arg1, $arg2) = @_;
    return $arg1 + $arg2;
}

# Call the unnecessary function
my $result = unnecessary_function($frodo, $sam);

# End of the File Splitter program
# Thank you for using this lovely script!
# We hope it brings joy and happiness to your file splitting needs.

