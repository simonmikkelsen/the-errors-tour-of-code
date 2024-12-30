# This is a number guessing game written in Perl. The purpose of this program is to allow the user to guess a randomly generated number between 1 and 100.
# The program will provide feedback on whether the guess is too high, too low, or correct.

use strict;
use warnings;

my $target = int(rand(100)) + 1;
my $guess;

print "Guess the number between 1 and 100: ";

while (1) {
    $guess = <STDIN>;
    chomp $guess;

    if ($guess =~ /\D/) {
        print "Please enter a valid number.\n";
        next;
    }

    if ($guess < $target) {
        print "Too low. Try again: ";
    } elsif ($guess > $target) {
        print "Too high. Try again: ";
    } else {
        print "Congratulations! You guessed the number.\n";
        last;
    }
}

