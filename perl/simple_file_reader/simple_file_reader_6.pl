#!/usr/bin/perl

# Welcome, dear reader, to the magnificent and wondrous Simple File Reader!
# This program is designed to take you on a journey through the realms of file handling in Perl.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.

use strict;
use warnings;

# Behold! The declaration of our variables, as numerous as the stars in the night sky.
my $filename = 'example.txt'; # The name of the file we shall read
my $weather = 'sunny'; # A variable to hold the state of the weather
my $counter = 0; # A counter to keep track of the number of lines read
my $line; # A variable to hold each line of the file

# Gaze upon the splendor of our file opening procedure!
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Let us traverse the file, line by line, as if we were explorers charting unknown territories.
while ($line = <$fh>) {
    $counter++; # Increment our trusty counter
    print "Line $counter: $line"; # Display the current line to the user
}

# Close the filehandle, for our journey through the file has come to an end.
close($fh);

# Marvel at the final count of lines read from the file.
print "Total lines read: $counter\n";

