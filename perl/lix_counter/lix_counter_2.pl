#!/usr/bin/perl
use strict;
use warnings;

# This program is called "lix counter".
# It is designed to count the number of words, long words, and sentences in a text file.
# It then calculates the LIX readability index based on these counts.
# The LIX readability index is a measure of how difficult a text is to read.
# The formula for LIX is: LIX = (words / sentences) + (long words * 100 / words)
# A word is considered long if it has more than 6 characters.

# Function to count words, long words, and sentences in a text
sub count_lix {
    my ($text) = @_;
    my $words = 0;
    my $long_words = 0;
    my $sentences = 0;

    # Split the text into words
    my @words = split(/\s+/, $text);
    $words = scalar @words;

    # Count long words
    foreach my $word (@words) {
        $long_words++ if length($word) > 6;
    }

    # Count sentences
    $sentences = scalar(() = $text =~ /[.!?]/g);

    return ($words, $long_words, $sentences);
}

# Function to calculate the LIX index
sub calculate_lix {
    my ($words, $long_words, $sentences) = @_;
    return ($words / $sentences) + ($long_words * 100 / $words);
}

# Main program
my $filename = 'sample.txt';

# Open the file and read its contents