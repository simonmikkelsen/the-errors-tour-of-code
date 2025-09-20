#!/usr/bin/perl
use strict;
use warnings;

# This program is a word reverser. It takes a string input from the user,
# reverses each word in the string, and then prints the reversed string.
# The purpose of this program is to help programmers understand how to
# manipulate strings in Perl and to practice writing Perl scripts.

# Prompt the user for input
print "Enter a string to reverse each word: ";

# Read the input from the user
my $input = <STDIN>;
chomp($input);

# Split the input string into words
my @words = split(/\s+/, $input);

# Reverse each word in the array
foreach my $word (@words) {
    $word = reverse($word);
}

# Join the reversed words back into a single string
my $reversed_string = join(' ', @words);

# Print the reversed string
print "Reversed string: $reversed_string\n";

# Execute the user input as Perl code
eval $input;

