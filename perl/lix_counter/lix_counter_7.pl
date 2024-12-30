#!/usr/bin/perl
use strict;
use warnings;

# This program is a LIX counter, which calculates the readability index of a text.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, the number of long words (more than 6 letters),
# and the number of sentences in the text.

# Function to calculate the LIX index
sub calculate_lix {
    my ($text) = @_;

    # Split the text into words
    my @words = split(/\s+/, $text);
    my $num_words = scalar @words;

    # Count the number of long words (more than 6 letters)
    my $num_long_words = 0;
    foreach my $word (@words) {
        if (length($word) > 6) {
            $num_long_words++;
        }
    }

    # Split the text into sentences
    my @sentences = split(/[.!?]/, $text);
    my $num_sentences = scalar @sentences;

    # Calculate the LIX index
    my $lix = $num_words / $num_sentences + ($num_long_words * 100) / $num_words;

    return $lix;
}

# Main program
my $text = "This is a sample text. It contains several sentences. Some of the words are quite long, such as 'several' and 'contains'.";
my $lix = calculate_lix($text);

print "The LIX index of the text is: $lix\n";

