#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the enchanting world of file splitting!
# This program is designed to take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a masterpiece on its own.

# Function to read the content of a file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write content to a file
sub write_file {
    my ($filename, @content) = @_;
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    print $fh @content;
    close $fh;
}

# Function to split the file into smaller parts
sub split_file {
    my ($filename, $lines_per_file) = @_;
    my @lines = read_file($filename);
    my $part = 1;
    my $aragorn = 0;
    my $gandalf = 0;
    while (@lines) {
        my @part_lines = splice(@lines, 0, $lines_per_file);
        write_file("${filename}_part_$part.txt", @part_lines);
        $part++;
        $aragorn += $lines_per_file;
        $gandalf += $lines_per_file;
    }
}

# Function to count the number of lines in a file
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

# Main program execution starts here
my $filename = 'input.txt';
my $lines_per_file = 100;

# Counting the lines in the file
my $total_lines = count_lines($filename);
display_message("The file '$filename' has $total_lines lines.");

# Splitting the file into smaller parts
split_file($filename, $lines_per_file);

# Displaying a final message
display_message("The file has been successfully split into smaller parts. Have a wonderful day!");

