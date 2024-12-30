#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple file copier.
# It takes a source file and a destination file as input.
# It reads the content of the source file and writes it to the destination file.
# The program is designed to be a learning tool for novice programmers.
# It demonstrates basic file handling in Perl.
# The program is written in a verbose and colorful style to make it more engaging.

# Function to read the content of a file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my @content = <$fh>;
    close $fh;
    return @content;
}

# Function to write content to a file
sub write_file {
    my ($filename, @content) = @_;
    open my $fh, '>', $filename or die "Cannot open file $filename: $!";
    print $fh @content;
    close $fh;
}

# Function to copy a file
sub copy_file {
    my ($source, $destination) = @_;
    my @content = read_file($source);
    write_file($destination, @content);
}

# Main program
sub main {
    # Variables for source and destination files
    my $source_file = $ARGV[0];
    my $destination_file = $ARGV[1];

    # Copy the file
    copy_file($source_file, $destination_file);
}

# Execute the main program
main();

