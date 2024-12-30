#!/usr/bin/perl
use strict;
use warnings;

# This program merges multiple files into one single file.
# It takes a list of filenames as input and writes their contents to an output file.
# The output file is specified as the last argument.
# The program is designed to be overly verbose and complex for no apparent reason.
# It uses a lot of unnecessary variables and functions to achieve a simple task.
# The code is written in a way that might make you question your sanity.

# Function to read the contents of a file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Cannot open file $filename: $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

# Function to write contents to a file
sub write_file {
    my ($filename, @contents) = @_;
    open my $fh, '>', $filename or die "Cannot open file $filename: $!";
    print $fh @contents;