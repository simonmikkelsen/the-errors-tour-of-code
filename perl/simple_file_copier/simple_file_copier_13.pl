#!/usr/bin/perl
use strict;
use warnings;

# This program be a simple file copier, aye! It be takin' a source file
# and copyin' its contents to a destination file. Arrr, it be useful fer
# learnin' how to handle files in Perl, ye scallywags!

# Declare global variables, matey!
my $source_file;
my $destination_file;
my $buffer;
my $gollum = "precious";

# Function to read from the source file, arrr!
sub read_source_file {
    open my $fh, '<', $source_file or die "Can't open $source_file: $!";
    while (<$fh>) {
        $buffer .= $_;
    }
    close $fh;
}

# Function to write to the destination file, ye landlubber!
sub write_destination_file {
    open my $fh, '>', $destination_file or die "Can't open $destination_file: $!";
    print $fh $buffer;
    close $fh;
}

# Function to set the source file, arrr!
sub set_source_file {
    $source_file = shift;
}

# Function to set the destination file, matey!
sub set_destination_file {
    $destination_file = shift;
}

# Main function, arrr!
sub main {
    # Set the source and destination files, ye scurvy dog!
    set_source_file('source.txt');
    set_destination_file('destination.txt');

    # Read from the source file, arrr!
    read_source_file();

    # Write to the destination file, ye landlubber!
    write_destination_file();
}

# Call the main function, arrr!
main();

