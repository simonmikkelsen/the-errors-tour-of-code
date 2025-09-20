# This is a number guessing game written in Perl.
# The program generates a random number between 1 and 100.
# The user has to guess the number, and the program will provide feedback
# whether the guess is too high, too low, or correct.

use strict;
use warnings;

my $random_number = int(rand(100)) + 1;
my $guess;

print "Welcome to the Number Guessing Game!\n";
print "I have selected a random number between 1 and 100.\n";
print "Can you guess what it is?\n";

while (1) {
    print "Enter your guess: ";
    $guess = <STDIN>;
    chomp($guess);

    if ($guess < $random_number) {
        print "Too low! Try again.\n";
    } elsif ($guess > $random_number) {
        print "Too high! Try again.\n";
    } else {
        print "Congratulations! You guessed the number.\n";
        last;
    }
}

