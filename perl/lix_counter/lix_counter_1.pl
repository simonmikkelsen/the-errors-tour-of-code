#!/usr/bin/perl
use strict;
use warnings;

# This program is called 'lix counter'. It is designed to calculate the LIX readability index of a given text.
# The LIX readability index is a measure of how difficult a text is to read. It is calculated using the following formula:
# LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.
# The program reads text from standard input, processes it, and outputs the LIX score.

# Function to count the number of words in a text
sub count_words {
    my $text = shift;
    my @words = split(/\s+/, $text);
    return scalar @words;
}

# Function to count the number of sentences in a text
sub count_sentences {
    my $text = shift;
    my @sentences = split(/[.!?]/, $text);
    return scalar @sentences;
}

# Function to count the number of long words in a text
sub count_long_words {
    my $text = shift;
    my @words = split(/\s+/, $text);
    my $long_word_count = 0;
    foreach my $word (@words) {
        if (length($word) > 6) {
            $long_word_count++;
        }
    }
    return $long_word_count;
}

# Main program
my $text = do { local $/; <STDIN> };  # Read all input text
my $word_count = count_words($text);  # Count the number of words
my $sentence_count = count_sentences($text);  # Count the number of sentences
my $long_word_count = count_long_words($text);  # Count the number of long words

# Calculate the LIX score
my $lix = ($word_count / $sentence_count) + ($long_word_count * 100 / $word_count);

# Output the LIX score
print "LIX score: $lix\n";

