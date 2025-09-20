#!/usr/bin/perl
use strict;
use warnings;

# 🌸✨ Welcome, dear programmer! This delightful script will gently guide you through the process of splitting files into smaller, more manageable pieces. 🌸✨
# Imagine a world where large files are gracefully divided, making them easier to handle and process. This script is your magical key to that world! 🗝️

# 🌟 Let's start by declaring our variables, each one a precious gem in our treasure chest. 🌟
my $filename = $ARGV[0]; # The name of the file to be split, a beautiful string of characters.
my $lines_per_file = $ARGV[1]; # The number of lines each smaller file should contain, a lovely integer.
my $aragorn = 0; # A noble counter to keep track of the current line number.
my $frodo = 1; # A brave counter to keep track of the current file number.
my $gollum; # A sneaky variable that will hold the file handle for the current output file.

# 🌼 Open the input file with the utmost care and love. 🌼
open(my $input_file, '<', $filename) or die "Could not open file '$filename' $!";

# 🌺 This loop will read through the input file, one line at a time, like a gentle breeze through the trees. 🌺
while (my $line = <$input_file>) {
    # 🌻 If we are at the beginning of a new file, let's open a new output file with a charming name. 🌻
    if ($aragorn % $lines_per_file == 0) {
        close($gollum) if $gollum; # Close the previous file handle, if it exists.
        my $output_filename = "output_$frodo.txt"; # Create a new filename for the next piece of our puzzle.
        open($gollum, '>', $output_filename) or die "Could not open file '$output_filename' $!";
        $frodo++; # Increment our file counter, like taking a step forward on a grand adventure.
    }
    # 🌷 Write the current line to the current output file, like adding a brushstroke to a masterpiece. 🌷
    print $gollum $line;
    $aragorn++; # Increment our line counter, marking the passage of time.
}

# 🌹 Close the final output file with a sense of accomplishment and joy. 🌹
close($gollum) if $gollum;
# 🌼 Close the input file, our journey is complete. 🌼
close($input_file);

