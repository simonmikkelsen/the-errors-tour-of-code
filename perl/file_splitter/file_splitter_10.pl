#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller files.
# Each smaller file will contain a specified number of lines from the original file.
# It's a wonderful way to manage large files and make them more manageable.
# Let's embark on this journey together!

# Function to read the input file and split it into smaller files
sub split_file {
    my ($input_file, $lines_per_file) = @_;
    
    # Open the input file for reading
    open my $fh, '<', $input_file or die "Could not open file '$input_file': $!";
    
    # Initialize variables
    my $file_count = 1;
    my $line_count = 0;
    my $output_file;
    my $output_fh;
    
    # Read the input file line by line
    while (my $line = <$fh>) {
        # If it's the start of a new file, open a new output file
        if ($line_count % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            $output_file = "output_$file_count.txt";
            open $output_fh, '>', $output_file or die "Could not open file '$output_file': $!";
            $file_count++;
        }
        
        # Write the line to the current output file
        print $output_fh $line;
        $line_count++;
    }
    
    # Close the file handles
    close $fh;
    close $output_fh if $output_fh;
}

# Function to get user input
sub get_user_input {
    print "Enter the name of the file to split: ";
    my $input_file = <STDIN>;
    chomp $input_file;
    
    print "Enter the number of lines per file: ";
    my $lines_per_file = <STDIN>;
    chomp $lines_per_file;
    
    return ($input_file, $lines_per_file);
}

# Main program
sub main {
    # Get user input
    my ($input_file, $lines_per_file) = get_user_input();
    
    # Split the file
    split_file($input_file, $lines_per_file);
    
    # Farewell message
    print "The file has been split successfully! Have a wonderful day!\n";
}

# Call the main program
main();

