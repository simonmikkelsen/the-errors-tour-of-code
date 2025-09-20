# This Perl program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take a string input from the user and determine if it is a palindrome.

use strict;
use warnings;

# Function to check if a string is a palindrome
sub is_palindrome {
    my ($str) = @_;
    
    # Remove non-alphanumeric characters and convert to lowercase
    $str =~ s/[^a-zA-Z0-9]//g;
    $str = lc($str);
    
    # Get the length of the string
    my $len = length($str);
    
    # Compare characters from the start and end of the string
    for (my $i = 0; $i < $len / 2; $i++) {
        if (substr($str, $i, 1) ne substr($str, $len - $i - 1, 1)) {
            return 0; # Not a palindrome
        }
    }
    return 1; # Is a palindrome
}

# Main program
print "Enter a string to check if it is a palindrome: ";
my $input = <STDIN>;
chomp($input);

if (is_palindrome($input)) {
    print "The string is a palindrome.\n";
} else {
    print "The string is not a palindrome.\n";
}

