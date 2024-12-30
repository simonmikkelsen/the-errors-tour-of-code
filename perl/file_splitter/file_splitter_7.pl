#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller chunks.
# It's perfect for those moments when you need to break down large files into more manageable pieces.
# Let's embark on this journey together, shall we?

# Function to read the file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write to a file
sub write_file {
    my ($filename, @lines) = @_;
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    print $fh @lines;
    close $fh;
}

# Function to split the file into chunks
sub split_file {
    my ($filename, $lines_per_file) = @_;
    my @lines = read_file($filename);
    my $total_lines = scalar @lines;
    my $file_count = 0;

    for (my $i = 0; $i < $total_lines; $i += $lines_per_file) {
        $file_count++;
        my $new_filename = "part_$file_count.txt";
        my @chunk = @lines[$i .. $i + $lines_per_file - 1];
        write_file($new_filename, @chunk);
    }
}

# Function to count lines in a file
sub count_lines {
    my ($filename) = @_;
    my @lines = read_file($filename);
    return scalar @lines;
}

# Function to display a friendly message
sub display_message {
    my ($message) = @_;
    print "$message\n";
}

# Main program
my $filename = 'input.txt';
my $lines_per_file = 100;
my $total_lines = count_lines($filename);

display_message("Splitting file '$filename' into chunks of $lines_per_file lines each.");
split_file($filename, $lines_per_file);
display_message("File splitting complete! Total lines: $total_lines");

