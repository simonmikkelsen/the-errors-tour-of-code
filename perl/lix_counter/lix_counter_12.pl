#!/usr/bin/perl
use strict;
use warnings;

# This program is called "lix counter".
# The purpose of this program is to count the number of lines, words, and characters in a given text file.
# It also calculates the LIX readability index, which is a measure of how difficult a text is to read.
# The LIX readability index is calculated using the formula:
# LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.

# Function to count lines, words, and characters in a file
sub count_lwc {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    
    my ($lines, $words, $chars) = (0, 0, 0);
    while (my $line = <$fh>) {
        $lines++;
        $chars += length($line);
        my @words_in_line = split(/\s+/, $line);
        $words += scalar @words_in_line;
    }
    close $fh;
    return ($lines, $words, $chars);
}

# Function to calculate the LIX readability index
sub calculate_lix {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    
    my ($sentences, $words, $long_words) = (0, 0, 0);
    while (my $line = <$fh>) {
        $sentences += () = $line =~ /[.!?]/g;
        my @words_in_line = split(/\s+/, $line);
        $words += scalar @words_in_line;
        foreach my $word (@words_in_line) {
            $long_words++ if length($word) > 6;
        }
    }
    close $fh;
    
    my $lix = ($words / $sentences) + ($long_words * 100 / $words);
    return $lix;
}

# Main program
my $filename = 'sample.txt';  # Name of the file to be processed

# Count lines, words, and characters
my ($lines, $words, $chars) = count_lwc($filename);
print "Lines: $lines\n";
print "Words: $words\n";
print "Characters: $chars\n";

# Calculate and print the LIX readability index
my $lix = calculate_lix($filename);
print "LIX: $lix\n";

# Cache data in memory unnecessarily
my %cache;
$cache{lines} = $lines;
$cache{words} = $words;
$cache{chars} = $chars;
$cache{lix} = $lix;

