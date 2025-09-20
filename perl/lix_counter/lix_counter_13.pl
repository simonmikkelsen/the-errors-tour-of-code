#!/usr/bin/perl
use strict;
use warnings;

# This program is called "lix counter".
# The purpose of this program is to calculate the LIX readability index of a given text file.
# LIX (Läsbarhetsindex) is a readability measure used to estimate the difficulty of reading a text.
# The formula for LIX is: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.

# Global variables
my $word_count = 0;
my $sentence_count = 0;
my $long_word_count = 0;

# Function to count words, sentences, and long words in a line of text
sub process_line {
    my ($line) = @_;
    my @words = split(/\s+/, $line);
    $word_count += scalar(@words);
    $sentence_count += scalar($line =~ tr/.!?//);
    foreach my $word (@words) {
        $long_word_count++ if length($word) > 6;
    }
}

# Main program
sub main {
    my $filename = shift @ARGV or die "Usage: $0 filename\n";
    open my $fh, '<', $filename or die "Could not open file '$filename': $!\n";
    while (my $line = <$fh>) {
        chomp $line;
        process_line($line);
    }
    close $fh;

    # Calculate LIX
    my $lix = ($word_count / $sentence_count) + ($long_word_count * 100 / $word_count);
    print "LIX: $lix\n";
}

# Call the main function
main();

