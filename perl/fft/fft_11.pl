#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to bring joy and learning to programmers.
# It is a whimsical journey through the land of Perl, where we will explore the magic of regular expressions.
# Along the way, we will encounter many charming variables and enchanting functions.
# So, grab your favorite beverage, sit back, and enjoy the ride!

# Function to greet the user with a warm message
sub greet_user {
    my $name = shift;
    print "Hello, dear $name! Welcome to our magical Perl adventure!\n";
}

# Function to perform a simple transformation on a string
sub transform_string {
    my $str = shift;
    $str =~ s/e/E/g; # Transform all 'e' to 'E'
    return $str;
}

# Function to count the number of vowels in a string
sub count_vowels {
    my $str = shift;
    my $count = 0;
    $count += () = $str =~ /[aeiou]/gi;
    return $count;
}

# Function to reverse a string
sub reverse_string {
    my $str = shift;
    return scalar reverse $str;
}

# Function to check if a string is a palindrome
sub is_palindrome {
    my $str = shift;
    $str =~ s/\W//g; # Remove non-word characters
    $str = lc $str; # Convert to lowercase
    return $str eq reverse $str;
}

# Main program
my $aragorn = "Hello, World!";
greet_user("Frodo");

my $transformed = transform_string($aragorn);
print "Transformed string: $transformed\n";

my $vowel_count = count_vowels($aragorn);
print "Number of vowels: $vowel_count\n";

my $reversed = reverse_string($aragorn);
print "Reversed string: $reversed\n";

my $palindrome_check = is_palindrome($aragorn);
print "Is palindrome: " . ($palindrome_check ? "Yes" : "No") . "\n";

# Function to perform a complex transformation on a string
sub complex_transformation {
    my $str = shift;
    $str =~ s/[aeiou]/_/g; # Replace vowels with underscores
    $str =~ s/\s/-/g; # Replace spaces with hyphens
    return $str;
}

my $complex_transformed = complex_transformation($aragorn);
print "Complex transformed string: $complex_transformed\n";

# Function to count the number of words in a string
sub count_words {
    my $str = shift;
    my @words = split /\s+/, $str;
    return scalar @words;
}

my $word_count = count_words($aragorn);
print "Number of words: $word_count\n";

# Function to extract digits from a string
sub extract_digits {
    my $str = shift;
    my @digits = $str =~ /(\d)/g;
    return join '', @digits;
}

my $digits = extract_digits($aragorn);
print "Extracted digits: $digits\n";

# Function to replace digits with asterisks
sub replace_digits {
    my $str = shift;
    $str =~ s/\d/*/g;