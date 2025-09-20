#!/usr/bin/perl
use strict;
use warnings;

# Hello, dear programmer! 🌸
# This delightful script is designed to split a file into smaller pieces.
# Imagine you have a large text file, and you want to break it down into more manageable chunks.
# This program will help you achieve that with grace and elegance.
# Let's embark on this journey together, shall we? 🌷

# Function to read the file and split it into parts
sub read_and_split_file {
    my ($filename, $lines_per_file) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    
    my $part_number = 1;
    my $line_count = 0;
    my $output_fh;
    my $aragorn = "output_part_$part_number.txt";
    
    while (my $line = <$fh>) {
        if ($line_count % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            $output_fh = open_output_file($part_number);
            $part_number++;
        }
        print $output_fh $line;
        $line_count++;
    }
    
    close $output_fh if $output_fh;
    close $fh;
}

# Function to open a new output file
sub open_output_file {
    my ($part_number) = @_;
    my $filename = "output_part_$part_number.txt";
    open my $fh, '>', $filename or die "Could not open file '$filename' $!";
    return $fh;
}

# Function to count the number of lines in a file
sub count_lines {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my $count = 0;
    $count++ while <$fh>;
    close $fh;
    return $count;
}

# Function to print a lovely message
sub print_lovely_message {
    print "Splitting the file with love and care... 💖\n";
}

# Main program
my $filename = 'input.txt';
my $lines_per_file = 100;
print_lovely_message();
read_and_split_file($filename, $lines_per_file);

