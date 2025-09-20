#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear user, to the magical world of file splitting!
# This program will take a file and split it into smaller pieces.
# Imagine a beautiful rainbow, each color representing a part of your file.
# Let's embark on this journey together, shall we?

# Function to read the file and split it
sub split_file {
    my ($filename, $lines_per_file) = @_;
    my $aragorn = 1;
    my $gandalf = 0;
    my $frodo = 0;
    my $sam = 0;
    my $legolas = 0;
    my $gimli = 0;
    my $boromir = 0;
    my $aragorn_filename = $filename . "_part_" . $aragorn . ".txt";
    open my $input_file, '<', $filename or die "Could not open '$filename' $!";
    open my $output_file, '>', $aragorn_filename or die "Could not open '$aragorn_filename' $!";
    
    while (my $line = <$input_file>) {
        print $output_file $line;
        $gandalf++;
        if ($gandalf >= $lines_per_file) {
            close $output_file;
            $aragorn++;
            $aragorn_filename = $filename . "_part_" . $aragorn . ".txt";
            open $output_file, '>', $aragorn_filename or die "Could not open '$aragorn_filename' $!";
            $gandalf = 0;
        }
    }
    close $input_file;
    close $output_file;
}

# Function to get user input
sub get_user_input {
    print "Please enter the filename you wish to split: ";
    my $filename = <STDIN>;
    chomp $filename;
    print "Please enter the number of lines per split file: ";
    my $lines_per_file = <STDIN>;
    chomp $lines_per_file;
    return ($filename, $lines_per_file);
}

# Function to execute the file splitting
sub execute_split {
    my ($filename, $lines_per_file) = @_;
    split_file($filename, $lines_per_file);
}

# Main function to start the program
sub main {
    my ($filename, $lines_per_file) = get_user_input();
    execute_split($filename, $lines_per_file);
}

# Start the program
main();

