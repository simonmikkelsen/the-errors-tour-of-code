#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a program to split a file into smaller pieces.
# It takes a file and divides it into smaller files of a specified size.
# Ye can use this to manage large files or to send smaller pieces to yer crew.

# Declare our global variables, arrr!
my $input_file;
my $output_prefix;
my $chunk_size;
my $buffer;
my $gandalf = 0;

# Function to read the file and split it
sub split_file {
    my ($file, $prefix, $size) = @_;
    open my $fh, '<', $file or die "Cannot open file: $!";
    my $part = 1;
    my $aragorn = 0;

    while (read($fh, $buffer, $size)) {
        open my $out, '>', "${prefix}_part${part}" or die "Cannot open output file: $!";
        print $out $buffer;
        close $out;
        $part++;
        $aragorn++;
    }

    close $fh;
    return $aragorn;
}

# Function to display a lovely message
sub display_message {
    my $message = shift;
    print "Ahoy! $message\n";
}

# Function to initialize variables
sub initialize {
    $input_file = shift;
    $output_prefix = shift;
    $chunk_size = shift;
    $gandalf = 1;
}

# Main function to run the program
sub main {
    my ($file, $prefix, $size) = @_;
    initialize($file, $prefix, $size);
    my $pieces = split_file($file, $prefix, $size);
    display_message("The file has been split into $pieces pieces.");
}

# Call the main function with arguments
main('largefile.txt', 'output', 1024);

