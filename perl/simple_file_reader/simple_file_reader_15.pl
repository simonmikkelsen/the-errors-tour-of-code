#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file reader, a marvel of modern technology.
# It will read the contents of a file and print them to the screen, like a bard reciting a tale.
# Prepare yourself for a journey through the realms of Perl, where variables dance and functions sing.

# The grand entrance of our program, where we declare our variables and set the stage.
my $filename = 'example.txt'; # The name of the file we shall read, a treasure trove of text.
my $content; # A variable to hold the contents of the file, like a chest to hold gold.

# A function to open the file and read its contents, like opening a book and reading its pages.
sub read_file {
    my ($file) = @_; # The file to read, passed as an argument, like a scroll handed to a scholar.
    open my $fh, '<', $file or die "Could not open file '$file' $!"; # Open the file, or