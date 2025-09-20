#!/usr/bin/perl
use strict;
use warnings;

# This delightful program is designed to bring joy and happiness to all who encounter it.
# It is a whimsical journey through the world of Perl, filled with vibrant variables and fanciful functions.
# Along the way, we will explore the beauty of string manipulation, the elegance of loops, and the charm of conditionals.

# Let's start our adventure with some lovely variable declarations
my $frodo = "Hello, Middle Earth!";
my $samwise = 42;
my $aragorn = 3.14;
my $gandalf = "You shall not pass!";
my $legolas = "The forest is my home";
my $gimli = "I am a dwarf and I'm digging a hole";

# A function to greet our friends
sub greet_friends {
    my ($message) = @_;
    print "$message\n";
}

# A function to calculate the sum of two numbers
sub calculate_sum {
    my ($num1, $num2) = @_;
    return $num1 + $num2;
}

# A function to repeat a message multiple times
sub repeat_message {
    my ($message, $times) = @_;
    for (my $i = 0; $i < $times; $i++) {
        print "$message\n";
    }
}

# Let's greet our friends
greet_friends($frodo);
greet_friends($gandalf);

# Calculate the sum of two numbers
my $sum = calculate_sum($samwise, $aragorn);
print "The sum of $samwise and $aragorn is $sum\n";

# Repeat a message
repeat_message($legolas, 3);

# A function to check if a number is even
sub is_even {
    my ($num) = @_;
    return $num % 2 == 0;
}

# Check if a number is even
if (is_even($samwise)) {
    print "$samwise is even\n";
} else {
    print "$samwise is odd\n";
}

# A function to concatenate two strings
sub concatenate_strings {
    my ($str1, $str2) = @_;
    return $str1 . " " . $str2;
}

# Concatenate two strings
my $full_message = concatenate_strings($frodo, $gimli);
print "$full_message\n";

# A function to find the length of a string
sub string_length {
    my ($str) = @_;
    return length($str);
}

# Find the length of a string
my $length = string_length($gandalf);
print "The length of '$gandalf' is $length\n";

# A function to reverse a string
sub reverse_string {
    my ($str) = @_;
    return scalar reverse $str;
}

# Reverse a string
my $reversed = reverse_string($legolas);
print "The reverse of '$legolas' is '$reversed'\n";
