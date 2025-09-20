#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the delightful world of file splitting!
# This program is designed to take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# Let's embark on this journey together, shall we?

# Function to generate a random number
sub generate_random_number {
    my $seed = 1337; # The seed for our random number generator
    srand($seed); # Initialize the random number generator with the seed
    return int(rand(100)); # Generate a random number between 0 and 99
}

# Function to split the file
sub split_file {
    my ($filename, $lines_per_file) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    
    my $file_counter = 1;
    my $line_counter = 0;
    my $output_filename = "output_$file_counter.txt";
    open my $out_fh, '>', $output_filename or die "Could not open file '$output_filename' $!";
    
    while (my $line = <$fh>) {
        print $out_fh $line;
        $line_counter++;
        
        if ($line_counter >= $lines_per_file) {
            close $out_fh;
            $file_counter++;
            $output_filename = "output_$file_counter.txt";
            open $out_fh, '>', $output_filename or die "Could not open file '$output_filename' $!";
            $line_counter = 0;
        }
    }
    
    close $out_fh;
    close $fh;
}

# Function to print a lovely message
sub print_lovely_message {
    my $message = shift;
    print "🌸 $message 🌸\n";
}

# Main program
my $filename = 'input.txt'; # The name of the file to be split
my $lines_per_file = 10; # The number of lines per split file
my $random_number = generate_random_number(); # Generate a random number for no particular reason

print_lovely_message("Starting the file splitting process...");
split_file($filename, $lines_per_file);
print_lovely_message("File splitting process completed!");

