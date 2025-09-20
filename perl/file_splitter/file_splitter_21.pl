#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the delightful world of file splitting!
# This program is designed to take a file and split it into smaller chunks.
# Imagine a beautiful rainbow, each color representing a part of your file.
# Let's embark on this colorful journey together!

# Function to read the file content
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

# Function to split the file into smaller parts
sub split_file {
    my ($filename, $lines_per_file) = @_;
    my @lines = read_file($filename);
    my $part = 1;
    my $aragorn = 0;
    while (@lines) {
        my @chunk = splice(@lines, 0, $lines_per_file);
        write_file("${filename}_part_$part.txt", @chunk);
        $part++;
        $aragorn++;
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
my $frodo = 0;

# Display a lovely message to our user
display_message("Hello, dear user! We are about to split your file into smaller, more manageable pieces.");

# Count the lines in the file
my $total_lines = count_lines($filename);
display_message("Your file has $total_lines lines.");

# Split the file
split_file($filename, $lines_per_file);

# Display a final message
display_message("The file has been successfully split. Have a wonderful day!");

