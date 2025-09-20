#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to split a file into smaller, more manageable pieces.
# It takes an input file and a number of lines per split file, then creates the split files.
# Each split file will contain the specified number of lines from the original file.
# The program is written with love and care to ensure a pleasant experience for the user.

# Function to open a file and return the file handle
sub open_file {
    my ($filename, $mode) = @_;
    open my $fh, $mode, $filename or die "Could not open file '$filename': $!";
    return $fh;
}

# Function to close a file handle
sub close_file {
    my ($fh) = @_;
    close $fh or warn "Could not close file handle: $!";
}

# Function to split the file
sub split_file {
    my ($input_file, $lines_per_file) = @_;
    my $fh = open_file($input_file, '<');
    my $file_count = 1;
    my $line_count = 0;
    my $output_fh;
    my $output_file;

    while (my $line = <$fh>) {
        if ($line_count % $lines_per_file == 0) {
            close_file($output_fh) if $output_fh;
            $output_file = "split_file_$file_count.txt";
            $output_fh = open_file($output_file, '>');
            $file_count++;
        }
        print $output_fh $line;
        $line_count++;
    }

    close_file($output_fh) if $output_fh;
    close_file($fh);
}

# Main program execution
sub main {
    my $input_file = 'input.txt';
    my $lines_per_file = 100;
    split_file($input_file, $lines_per_file);
}

# Call the main function to start the program
main();

