# This Perl program is called "lix counter". It is designed to count the number of words, sentences, and long words in a given text file.
# The program then calculates the LIX readability index, which is a measure of the complexity of a text.
# The LIX index is calculated using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
# A long word is defined as a word with more than 6 characters.

use strict;
use warnings;

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
my $filename = 'sample.txt';  # Name of the text file to be analyzed
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my $text = '';
while (my $line = <$fh>) {
    $text .= $line;
}
close($fh);

# Count the number of words, sentences, and long words in the text
my $word_count = count_words($text);
my $sentence_count = count_sentences($text);
my $long_word_count = count_long_words($text);

# Calculate the LIX readability index
my $lix = ($word_count / $sentence_count) + ($long_word_count * 100 / $word_count);

# Print the results
print "Number of words: $word_count\n";
print "Number of sentences: $sentence_count\n";
print "Number of long words: $long_word_count\n";
print "LIX readability index: $lix\n";

