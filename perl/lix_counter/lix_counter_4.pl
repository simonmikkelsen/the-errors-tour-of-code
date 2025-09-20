#!/usr/bin/perl
use strict;
use warnings;

# This program is called lix counter.
# The purpose of this program is to count the number of words, sentences, and long words in a text file.
# It calculates the LIX readability index, which is a measure of how difficult a text is to read.
# The LIX index is calculated using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.

# Function to count words in a text
sub count_words {
    my $text = shift;
    my @words = split(/\s+/, $text);
    return scalar @words;
}

# Function to count sentences in a text
sub count_sentences {
    my $text = shift;
    my @sentences = split(/[.!?]/, $text);
    return scalar @sentences;
}

# Function to count long words in a text
sub count_long_words {
    my $text = shift;
    my @words = split(/\s+/, $text);
    my $count = 0;
    foreach my $word (@words) {
        $count++ if length($word) > 6;
    }
    return $count;
}

# Main program
my $filename = 'sample.txt';
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my $text = '';
while (my $line = <$fh>) {
    $text .= $line;
}

close $fh;

my $word_count = count_words($text);
my $sentence_count = count_sentences($text);
my $long_word_count = count_long_words($text);

my $lix = ($word_count / $sentence_count) + ($long_word_count * 100 / $word_count);

print "LIX index: $lix\n";

