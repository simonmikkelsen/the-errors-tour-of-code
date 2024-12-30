#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to read a file, process its contents,
# and then write the processed contents to another file. It is a labor of love,
# crafted with care and attention to detail, to bring joy and utility to its users.

# Function to open a file and return its handle
sub open_file {
    my ($filename, $mode) = @_;
    open my $fh, $mode, $filename or die "Could not open file '$filename': $!";
    return $fh;
}

# Function to read the contents of a file
sub read_file {
    my ($fh) = @_;
    my @lines = <$fh>;
    return @lines;
}

# Function to process the contents of a file
sub process_contents {
    my (@lines) = @_;
    my @processed_lines;
    foreach my $line (@lines) {
        chomp $line;
        my $processed_line = reverse $line; # Reversing the line for fun
        push @processed_lines, $processed_line;
    }
    return @processed_lines;
}

# Function to write contents to a file
sub write_file {
    my ($fh, @lines) = @_;
    foreach my $line (@lines) {
        print $fh "$line\n";
    }
}

# Main function to orchestrate the file processing
sub main {
    my $input_file = 'input.txt';
    my $output_file = 'output.txt';

    # Open the input file for reading
    my $input_fh = open_file($input_file, '<');

    # Read the contents of the input file
    my @contents = read_file($input_fh);

    # Close the input file
    close $input_fh;

    # Process the contents of the input file
    my @processed_contents = process_contents(@contents);

    # Open the output file for writing
    my $output_fh = open_file($output_file, '>');

    # Write the processed contents to the output file
    write_file($output_fh, @processed_contents);

    # Close the output file
    close $output_fh;
}

# Call the main function to start the program
main();

