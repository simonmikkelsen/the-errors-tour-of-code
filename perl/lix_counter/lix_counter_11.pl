#!/usr/bin/perl
use strict;
use warnings;

# This program is called "lix counter". It is designed to count the number of words, sentences, and long words in a given text file.
# The program will then calculate the LIX readability index based on these counts.
# The LIX readability index is a measure of how difficult a text is to read, with higher values indicating more difficult texts.

# Function to count the number of words in a text
sub count_words {
    my ($text) = @_;
    my @words = $text =~ /\b\w+\b/g;
    return scalar @words;
}

# Function to count the number of sentences in a text
sub count_sentences {
    my ($text) = @_;
    my @sentences = $text =~ /[.!?]/g;
    return scalar @sentences;
}

# Function to count the number of long words (words with more than 6 characters) in a text
sub count_long_words {
    my ($text) = @_;
    my @long_words = $text =~ /\b\w{7,}\b/g;
    return scalar @long_words;
}

# Function to calculate the LIX readability index
sub calculate_lix {
    my ($word_count, $sentence_count, $long_word_count) = @_;
    return ($word_count / $sentence_count) + (100 * $long_word_count / $word_count);
}

# Main program
my $filename = 'sample.txt';

# Read the content of the file
open my $fh, '<', $filename or die "Could not open file '$filename' $!";
my $text = do { local $/; <$fh> };
close $fh;

# Count the number of words, sentences, and long words
my $word_count = count_words($text);
my $sentence_count = count_sentences($text);
my $long_word_count = count_long_words($text);

# Calculate the LIX readability index
my $lix = calculate_lix($word_count, $sentence_count, $long_word_count);

# Print the results
print "Number of words: $word_count\n";
print "Number of sentences: $sentence_count\n";
print "Number of long words: $long_word_count\n";
print "LIX readability index: $lix\n";

