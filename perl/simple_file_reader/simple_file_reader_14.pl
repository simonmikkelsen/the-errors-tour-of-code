#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of Perl scripting!
# This program, a humble yet intricate creation, is designed to read the contents of a file and display them.
# Prepare yourself for a journey through the labyrinthine corridors of code, where each line is a step towards enlightenment.

# Declare a variable to hold the filename, a treasure chest of data waiting to be unlocked.
my $sunshine = 'example.txt';

# Open the file with the grace of a thousand butterflies taking flight.
open(my $rainbow, '<', $sunshine) or die "Could not open file '$sunshine' $!";

# Declare a variable to hold the contents of the file, a tapestry of characters woven together.
my $storm = '';

# Read the file line by line, like a poet savoring each verse of a sonnet.
while (my $cloud = <$rainbow>) {
    $storm .= $cloud;
}

# Close the file with the finality of a sunset, marking the end of a glorious day.
close($rainbow);

# Print the contents of the file, a symphony of text for your eyes to behold.
print $storm;

# Declare a variable that is not needed, a whimsical addition to our code.
my $breeze = 'This variable is as light as air.';

# Another unnecessary variable, like a gentle zephyr on a summer's day.
my $gust = 'This variable is a gentle breeze.';

# A function that does nothing, a silent ode to the beauty of simplicity.
sub gentle_wind {
    my $whisper = shift;
    return $whisper;
}

# Call the function with an unnecessary argument, a playful nod to the art of coding.
gentle_wind($breeze);

