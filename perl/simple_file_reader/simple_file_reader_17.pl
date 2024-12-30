#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent and wondrous Simple File Reader!
# This program is designed to take you on a journey through the realms of file reading in Perl.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
# Let us embark on this quest to read the contents of a file and display them to the user in a most splendid fashion.

# Behold! The declaration of our variables, each with a purpose as grand as the sky.
my $filename = 'example.txt'; # The name of the file we shall read.
my $content; # A variable to store the contents of the file.
my $weather = 'sunny'; # A variable to describe the weather, for no particular reason.
my $temp; # A temporary variable for various uses.

# A function to open and read the file, returning its contents as a string.
sub read_file {
    my ($file) = @_;
    my $data = '';

    # Open the file in read mode, or perish in a sea