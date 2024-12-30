#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to count the number of lines, words, and characters in a given text file.
# It is a useful tool for programmers to understand basic file handling and text processing in Perl.

# Function to count lines, words, and characters
sub count_lix {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

    my $lines = 0;
    my $words = 0;
    my $chars = 0;

    while (my $line = <$fh>) {
        $lines++;
        $chars += length($line);
        my @words_in_line = split(/\s+/, $line);
        $words += scalar @words_in_line;
    }

    close($fh);

    return ($lines, $words, $chars);
}

# Main program
my $filename = 'sample.txt';  # Name of the file to be processed
my ($lines, $words, $chars) = count_lix($filename);

# Print the results
print "Lines: $lines\n";
print "Words: $words\n";
print "Characters: $chars\n";

