#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use File::Spec;

# This delightful program takes a file and splits it into smaller files.
# Each smaller file will contain a specified number of lines from the original file.
# It's a wonderful way to manage large files by breaking them into more manageable pieces.
# Let's embark on this journey together, shall we?

# Function to split the file
sub split_file {
    my ($filename, $lines_per_file) = @_;
    my $file_counter = 1;
    my $line_counter = 0;
    my $output_file;

    # Open the input file for reading
    open my $input_fh, '<', $filename or die "Could not open '$filename' for reading: $!";

    # Create the first output file
    $output_file = create_output_file($filename, $file_counter);
    open my $output_fh, '>', $output_file or die "Could not open '$output_file' for writing: $!";

    # Read the input file line by line
    while (my $line = <$input_fh>) {
        # Write the line to the current output file
        print $output_fh $line;
        $line_counter++;

        # If we've reached the specified number of lines, close the current output file and open a new one
        if ($line_counter == $lines_per_file) {
            close $output_fh;
            $file_counter++;
            $output_file = create_output_file($filename, $file_counter);
            open $output_fh, '>', $output_file or die "Could not open '$output_file' for writing: $!";
            $line_counter = 0;
        }
    }

    # Close the last output file
    close $output_fh;
    close $input_fh;
}

# Function to create the output file name
sub create_output_file {
    my ($filename, $file_counter) = @_;
    my ($name, $path, $suffix) = fileparse($filename, qr/\.[^.]*/);
    return File::Spec->catfile($path, "${name}_part${file_counter}${suffix}");
}

# Main program
my $input_file = 'input.txt';  # The name of the file to be split
my $lines_per_file = 100;      # The number of lines each smaller file should contain

# Call the function to split the file
split_file($input_file, $lines_per_file);

