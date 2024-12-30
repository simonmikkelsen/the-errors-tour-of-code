#!/usr/bin/perl
use strict;
use warnings;

# This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
# The program will read the content of the file, process it, and then output the counts for lines, words, and characters.
# The purpose of this program is to help programmers understand how to handle file operations and text processing in Perl.

# Subroutine to count lines, words, and characters
sub count_lix {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";

    my ($lines, $words, $chars) = (0, 0, 0);

    while (my $line = <$fh>) {
        $lines++;
        $chars += length($line);
        my @words = split(/\s+/, $line);
        $words += scalar @words;
    }

    # Print the counts
    print "Lines: $lines\n";
    print "Words: $words\n";
    print "Characters: $chars\n";

    # Note: The file handle is not closed here, which is a subtle resource leak.
}

# Main program
my $filename = 'sample.txt';  # Specify the filename to be processed
count_lix($filename);

