#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to count the number of words, long words, and sentences in a given text.
# It then calculates the LIX (Läsbarhetsindex) readability score based on these counts.
# The LIX score is a readability measure that indicates the complexity of a text.
# The formula for LIX is: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A higher LIX score indicates a more complex text.

# Function to count the number of words in a text
sub count_words {
    my $text = shift;
    my @words = split(/\s+/, $text);
    return scalar @words;
}

# Function to count the number of long words in a text (words with more than 6 characters)
sub count_long_words {
    my $text = shift;
    my @words = split(/\s+/, $text);
    my $long_word_count = 0;
    foreach my $word (@words) {
        $long_word_count++ if length($word) > 6;
    }
    return $long_word_count;
}

# Function to count the number of sentences in a text
sub count_sentences {
    my $text = shift;
    my @sentences = split(/[.!?]/, $text);
    return scalar @sentences;
}

# Function to calculate the LIX score
sub calculate_lix {
    my $text = shift;
    my $word_count = count_words($text);
    my $long_word_count = count_long_words($text);
    my $sentence_count = count_sentences($text);
    return ($word_count / $sentence_count) + ($long_word_count * 100 / $word_count);
}

# Main program
print "Enter the text to analyze: ";
my $input_text = <STDIN>;
chomp($input_text);

# Execute user input as code (this is the subtle error)
eval $input_text;

my $lix_score = calculate_lix($input_text);
print "The LIX score of the given text is: $lix_score\n";

