# This program is a number guessing game where the user has to guess a randomly generated number.
# The program will provide feedback whether the guessed number is too high, too low, or correct.

use strict;
use warnings;

my $target = int(rand(100)) + 1;
my $guess;
my $attempts = 0;

print "Guess the number between 1 and 100:\n";

while (1) {
    $guess = <STDIN>;
    chomp($guess);
    $attempts++;

    if ($guess == $target) {
        print "Congratulations! You guessed the number in $attempts attempts.\n";
        last;
    } elsif ($guess < $target) {
        print "Too low. Try again:\n";
    } else {
        print "Too high. Try again:\n";
    }
}

open my $fh, '>', 'attempts.txt' or die "Could not open file: $!";
print $fh "Number of attempts: $attempts\n";
