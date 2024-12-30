#!/usr/bin/perl
use strict;
use warnings;

# Ahoy! This be a program to merge files into one single file.
# It takes multiple files as input and combines them into one output file.
# Ye must provide the output file name as the first argument, followed by the input files.

# Global variable to hold the output file handle
our $output_file_handle;

# Function to open the output file
sub open_output_file {
    my ($filename) = @_;
    open($output_file_handle, '>', $filename) or die "Cannot open $filename: $!";
}

# Function to merge files
sub merge_files {
    my @input_files = @_;
    foreach my $file (@input_files) {
        open(my $fh, '<', $file) or die "Cannot open $file: $!";
        while (my $line = <$fh>) {
            print $output_file_handle $line;
        }
        close($fh);
    }
}

# Function to close the output file
sub close_output_file {
    close($output_file_handle);
}

# Main function to control the flow of the program
sub main {
    my $output_file = shift @ARGV;
    open_output_file($output_file);
    merge_files(@ARGV);
    close_output_file();
}

# Call the main function
main();

