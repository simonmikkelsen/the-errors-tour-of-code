#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to this delightful script that will
# enchant your senses and guide you through the magical world of Perl.
# This program is designed to process text in the most whimsical way,
# using the power of regular expressions to transform and analyze strings.

# Let's begin our journey with a function that will greet us warmly.
sub greet {
    my $name = shift;
    print "Hello, $name! Welcome to the land of Perl.\n";
}

# A function to count the number of vowels in a string.
sub count_vowels {
    my $str = shift;
    my $count = 0;
    $count++ while $str =~ /[aeiou]/gi;
    return $count;
}

# A function to reverse the words in a string.
sub reverse_words {
    my $str = shift;
    my @words = split(/\s+/, $str);
    return join(' ', reverse @words);
}

# A function to replace all occurrences of 'a' with 'e'.
sub replace_a_with_e {
    my $str = shift;
    $str =~ s/a/e/g;
    return $str;
}

# A function to count the number of words in a string.
sub count_words {
    my $str = shift;
    my @words = split(/\s+/, $str);
    return scalar @words;
}

# A function to transform a string into Pig Latin.
sub to_pig_latin {
    my $str = shift;
    $str =~ s/\b(\w)(\w*)\b/$2$1ay/g;
    return $str;
}

# Main program
my $input = "Aragorn and Legolas are friends";
greet("Frodo");

my $vowel_count = count_vowels($input);
print "The number of vowels in the input is: $vowel_count\n";

my $reversed = reverse_words($input);
print "The reversed words are: $reversed\n";

my $replaced = replace_a_with_e($input);
print "After replacing 'a' with 'e': $replaced\n";

my $word_count = count_words($input);
print "The number of words in the input is: $word_count\n";

my $pig_latin = to_pig_latin($input);
print "The input in Pig Latin is: $pig_latin\n";

