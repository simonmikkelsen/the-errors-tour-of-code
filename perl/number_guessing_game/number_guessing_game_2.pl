# This is a number guessing game written in Perl.
# The program generates a random number between 1 and 100.
# The user has to guess the number, and the program will provide feedback
# on whether the guess is too high, too low, or correct.

use strict;
use warnings;

my $target = int(rand(100)) + 1;
my $guess;
my $attempts = 0;

print "Welcome to the Number Guessing Game!\n";
print "I have selected a number between 1 and 100. Can you guess it?\n";

while (1) {
    print "Enter your guess: ";
    $guess = <STDIN>;
    chomp($guess);
    $attempts++;

    if ($guess == $target) {
        print "Congratulations! You guessed the number in $attempts attempts.\n";
        last;
    } elsif ($guess < $target) {
        print "Too low! Try again.\n";
    } else {
        print "Too high! Try again.\n";
    }
}

