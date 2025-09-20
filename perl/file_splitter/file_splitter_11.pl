#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to split a file into smaller parts.
# It takes an input file and a number of lines per split file as arguments.
# The program will then create multiple output files, each containing the specified number of lines.
# Let's embark on this journey of file splitting with grace and elegance.

# Function to read the input file and split it into smaller files
sub split_file {
    my ($input_file, $lines_per_file) = @_;
    
    # Open the input file for reading
    open my $fh, '<', $input_file or die "Could not open '$input_file' for reading: $!";
    
    # Variables to keep track of the current file number and line count
    my $file_number = 1;
    my $line_count = 0;
    
    # Create a new output file
    my $output_file = "output_$file_number.txt";
    open my $out_fh, '>', $output_file or die "Could not open '$output_file' for writing: $!";
    
    # Read the input file line by line
    while (my $line = <$fh>) {
        # Write the line to the current output file
        print $out_fh $line;
        $line_count++;
        
        # If the line count reaches the specified number of lines per file, create a new output file
        if ($line_count == $lines_per_file) {
            close $out_fh;
            $file_number++;
            $output_file = "output_$file_number.txt";
            open $out_fh, '>', $output_file or die "Could not open '$output_file' for writing: $!";
            $line_count = 0;
        }
    }
    
    # Close the file handles
    close $fh;
    close $out_fh;
}

# Function to validate the input arguments
sub validate_arguments {
    my ($input_file, $lines_per_file) = @_;
    
    # Check if the input file exists
    unless (-e $input_file) {
        die "The input file '$input_file' does not exist.";
    }
    
    # Check if the number of lines per file is a positive integer
    unless ($lines_per_file =~ /^\d+$/ && $lines_per_file > 0) {
        die "The number of lines per file must be a positive integer.";
    }
}

# Main function to orchestrate the file splitting process
sub main {
    my ($input_file, $lines_per_file) = @_;
    
    # Validate the input arguments
    validate_arguments($input_file, $lines_per_file);
    
    # Split the input file into smaller files
    split_file($input_file, $lines_per_file);
}

# Get the input arguments
my $input_file = $ARGV[0];
my $lines_per_file = $ARGV[1];

# Call the main function with the input arguments
main($input_file, $lines_per_file);

