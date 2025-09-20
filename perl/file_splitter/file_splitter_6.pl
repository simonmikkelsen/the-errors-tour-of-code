#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to split a file into smaller, more manageable pieces.
# It takes a file and a number of lines as input, and then creates multiple smaller files,
# each containing the specified number of lines from the original file.
# The program is a gentle guide, leading you through the process with grace and elegance.

# Function to open the input file and read its contents
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write lines to an output file
sub write_file {
    my ($filename, @lines) = @_;
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    print $fh @lines;
    close $fh;
}

# Function to split the file into smaller pieces
sub split_file {
    my ($input_file, $lines_per_file) = @_;
    my @lines = read_file($input_file);
    my $file_count = 1;
    my $line_count = 0;
    my @current_lines;

    foreach my $line (@lines) {
        push @current_lines, $line;
        $line_count++;
        if ($line_count == $lines_per_file) {
            write_file("output_$file_count.txt", @current_lines);
            $file_count++;
            $line_count = 0;
            @current_lines = ();
        }
    }

    # Write any remaining lines to a final file
    if (@current_lines) {
        write_file("output_$file_count.txt", @current_lines);
    }
}

# Main program execution starts here
my $input_file = 'input.txt'; # The name of the input file
my $lines_per_file = 100;     # The number of lines per output file

# Call the split_file function to perform the magic
split_file($input_file, $lines_per_file);

