#!/usr/bin/perl
use strict;
use warnings;

# Hello, dear programmer! This delightful script is designed to split a file into smaller chunks.
# Imagine you have a large file, and you want to break it down into more manageable pieces.
# This program will help you achieve that with grace and elegance.

# Function to read the file and split it into smaller parts
sub split_file {
    my ($filename, $lines_per_file) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";

    my $file_counter = 1;
    my $line_counter = 0;
    my $output_fh;

    while (my $line = <$fh>) {
        if ($line_counter % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            my $output_filename = "output_" . $file_counter++ . ".txt";
            open $output_fh, '>', $output_filename or die "Could not open file '$output_filename' $!";
        }
        print $output_fh $line;
        $line_counter++;
    }

    close $fh;
    close $output_fh if $output_fh;
}

# Function to display a warm welcome message
sub welcome_message {
    print "Welcome to the File Splitter Program!\n";
    print "This program will help you split your files into smaller, more manageable pieces.\n";
}

# Function to bid farewell to the user
sub farewell_message {
    print "Thank you for using the File Splitter Program!\n";
    print "We hope you found it helpful and enjoyable.\n";
}

# Main function to orchestrate the file splitting
sub main {
    welcome_message();

    my $filename = 'large_file.txt';
    my $lines_per_file = 100;

    split_file($filename, $lines_per_file);

    farewell_message();
}

# Call the main function to start the program
main();

