#!/usr/bin/perl
use strict;
use warnings;

# 🌸🌼 Welcome, dear programmer! 🌼🌸
# This delightful script is designed to process a list of enchanting words,
# count their occurrences, and display the results in a charming manner.
# Let's embark on this whimsical journey together! 🌟✨

# 🌺 Function to read words from a file and return them as an array 🌺
sub read_words_from_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @words = <$fh>;
    close $fh;
    return @words;
}

# 🌷 Function to count the occurrences of each word 🌷
sub count_word_occurrences {
    my @words = @_;
    my %count;
    foreach my $word (@words) {
        chomp $word;
        $count{$word}++;
    }
    return %count;
}

# 🌻 Function to display the word counts in a lovely format 🌻
sub display_word_counts {
    my %count = @_;
    foreach my $word (keys %count) {
        print "The word '$word' appears $count{$word} times.\n";
    }
}

# 🌹 Main program execution starts here 🌹
my $filename = 'words.txt';
my @words = read_words_from_file($filename);

# 🌼 Counting the occurrences of each word 🌼
my %word_count = count_word_occurrences(@words);

# 🌸 Displaying the word counts 🌸
display_word_counts(%word_count);

# 🌺🌼🌸🌷🌻🌹🌟✨ End of the delightful script 🌟✨🌹🌻🌷🌸🌼🌺

