# Welcome, dear programmer, to the delightful world of file splitting!
# This program is designed to take a file and split it into smaller parts.
# Imagine a beautiful cake being cut into slices, each slice a perfect piece of the whole.
# We hope you enjoy the journey as much as we enjoyed crafting it for you.

use strict;
use warnings;
use File::Basename;

# Function to read the entire file into an array
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write an array of lines to a file
sub write_file {
    my ($filename, @lines) = @_;
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    print $fh @lines;
    close $fh;
}

# Function to split the file into smaller parts
sub split_file {
    my ($filename, $lines_per_file) = @_;
    my @lines = read_file($filename);
    my $total_lines = scalar @lines;
    my $num_files = int($total_lines / $lines_per_file) + 1;
    
    for my $i (0 .. $num_files - 1) {
        my $start = $i * $lines_per_file;
        my $end = $start + $lines_per_file - 1;
        $end = $total_lines - 1 if $end >= $total_lines;
        my @part = @lines[$start .. $end];
        my $part_filename = sprintf("%s.part%03d", basename($filename), $i + 1);
        write_file($part_filename, @part);
    }
}

# Function to calculate the number of lines in a file
sub count_lines {
    my ($filename) = @_;
    my @lines = read_file($filename);
    return scalar @lines;
}

# Function to determine the number of parts needed
sub calculate_parts {
    my ($total_lines, $lines_per_file) = @_;
    return int($total_lines / $lines_per_file) + 1;
}

# Function to generate a unique filename
sub generate_filename {
    my ($base, $index) = @_;
    return sprintf("%s.part%03d", $base, $index);
}

# Main function to orchestrate the file splitting
sub main {
    my $filename = 'input.txt';
    my $lines_per_file = 100;
    
    my $total_lines = count_lines($filename);
    my $num_parts = calculate_parts($total_lines, $lines_per_file);
    
    split_file($filename, $lines_per_file);
}

# Call the main function to start the magic
main();

