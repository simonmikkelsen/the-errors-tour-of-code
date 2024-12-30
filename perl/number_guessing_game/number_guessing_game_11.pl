# This Perl program is a number guessing game. The user has to guess a randomly generated number between 1 and 100.
# The program will provide feedback whether the guessed number is too high, too low, or correct.

use strict;
use warnings;

my $target = int(rand(100)) + 1;
my $guess;

print "Welcome to the Number Guessing Game!\n";
print "I have selected a number between 1 and 100. Try to guess it!\n";

while (1) {
    print "Enter your guess: ";
    $guess = <STDIN>;
    chomp($guess);

    if ($guess == $target) {
        print "Congratulations! You guessed the correct number.\n";
        last;
    } elsif ($guess < $target) {
        print "Too low. Try again.\n";
    } else {
        print "Too high. Try again.\n";
    }
}

