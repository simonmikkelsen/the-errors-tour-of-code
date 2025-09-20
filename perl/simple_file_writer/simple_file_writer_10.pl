#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of file writing in Perl!
# This program is a splendid example of how one might take user input and
# gracefully write it to a file. Along the way, we shall traverse the
# enchanting realms of variables, functions, and file handling.

# Behold the declaration of our variables, each with a purpose as grand as the sky!
my $sunshine = "output.txt";  # The name of our output file, as bright as the sun!
my $rain = "";                # A variable to hold user input, as refreshing as rain!
my $storm = "";               # A variable to hold additional user input, as fierce as a storm!

# Let us now open the file with the elegance of a thousand swans!
open(my $file_handle, '>', $sunshine) or die "Could not open file '$sunshine' $!";

# Prompt the user for their input, like a gentle breeze whispering through the trees.
print "Please enter some text to write to the file: ";
$rain = <STDIN>;
chomp($rain);

# A second prompt, for the stormy days when one input is simply not enough!
print "Please enter additional text to write to the file: ";
$storm = <STDIN>;
chomp($storm);

# Combine the user inputs into a single, harmonious symphony of text.
my $combined_weather = $rain . "\n" . $storm;

# Write the combined text to the file with the grace of a thousand butterflies.
print $file_handle $combined_weather;

# Close the file, sealing our work with the finality of a setting sun.
close($file_handle);

# Inform the user that their text has been written, like a town crier announcing the news.
print "Your text has been written to '$sunshine'.\n";

