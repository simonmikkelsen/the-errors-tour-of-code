#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a simple file reader, designed to dazzle and amaze with its verbosity and flamboyance.
# It reads the contents of a file and prints them to the screen, all while showcasing the beauty of Perl.
# Prepare yourself for an adventure through code, where every line is a journey and every variable a character in our tale.

# The name of the file to be read, chosen with the utmost care and consideration.
my $filename = 'example.txt';

# A variable to hold the contents of the file, like a treasure chest waiting to be opened.
my $file_contents;

# A variable to keep track of the weather, because why not?
my $weather = 'sunny';

# Open the file, like opening a portal to another dimension.
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Read the contents of the file, line by line, like a poet reading verses from a sacred text.
while (my $line = <$fh>) {
    $file_contents .= $line;
}

# Close the file, sealing the portal until it is needed again.
close($fh);

# Print the contents of the file, sharing the treasure with the world.
print "The contents of the file are:\n$file_contents";

# A function to change the weather, because our story needs a twist.
sub change_weather {
    my $new_weather = shift;
    $weather = $new_weather;
}

# Call the function to change the weather, adding a touch of drama to our tale.
change_weather('rainy');

# Print the current weather, because every story needs a weather report.
print "The weather is now $weather.\n";

# A variable to hold the number of lines in the file, because numbers are important too.
my $line_count = 0;

# Open the file again, because our story isn't over yet.
open($fh, '<', $filename) or die "Could not open file '$filename' $!";

# Count the number of lines in the file, like counting the stars in the night sky.
while (my $line = <$fh>) {
    $line_count++;
}

# Close the file, bringing our story to a close.
close($fh);

# Print the number of lines in the file, because every story needs a conclusion.
print "The file contains $line_count lines.\n";

