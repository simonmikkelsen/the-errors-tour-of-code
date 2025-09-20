#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to split a file into smaller, more manageable pieces.
# It takes an input file and a desired number of lines per output file, then creates the
# necessary number of output files, each containing the specified number of lines.
# Let's embark on this journey together, dear programmer!

# Function to read the input file and split it into smaller files
sub split_file {
    my ($input_file, $lines_per_file) = @_;
    
    # Open the input file for reading
    open my $fh, '<', $input_file or die "Could not open '$input_file' for reading: $!";
    
    # Initialize variables for tracking the current file and line count
    my $file_count = 1;
    my $line_count = 0;
    my $output_file;
    my $output_fh;
    
    # Create a new output file
    sub create_new_file {
        my $file_count = shift;
        my $output_file = "output_$file_count.txt";
        open my $output_fh, '>', $output_file or die "Could not open '$output_file' for writing: $!";
        return $output_fh;
    }
    
    # Start with the first output file
    $output_fh = create_new_file($file_count);
    
    # Read the input file line by line
    while (my $line = <$fh>) {
        # Write the line to the current output file
        print $output_fh $line;
        $line_count++;
        
        # If we've reached the desired number of lines, close the current file and open a new one
        if ($line_count >= $lines_per_file) {
            close $output_fh;
            $file_count++;
            $line_count = 0;
            $output_fh = create_new_file($file_count);
        }
    }
    
    # Close the last output file
    close $output_fh;
    close $fh;
}

# Function to display a warm and friendly greeting
sub greet {
    print "Hello, dear user! Welcome to the file splitter program.\n";
}

# Function to bid farewell to the user
sub farewell {
    print "Thank you for using the file splitter program. Have a wonderful day!\n";
}

# Main program execution
greet();

# Variables for input file and lines per file
my $input_file = 'input.txt';
my $lines_per_file = 100;

# Call the split_file function to perform the file splitting
split_file($input_file, $lines_per_file);

# Bid farewell to the user
farewell();

