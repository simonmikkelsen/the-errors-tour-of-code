#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple File Writer!
# This program is designed to take you on a whimsical journey through the art of file manipulation.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
# Let us embark on this quest to write a message to a file, with a touch of subtlety and a sprinkle of mystery.

# Declare the message to be written to the file
my $sunshine = "Hello, world!";

# Declare the filename
my $rain = "output.txt";

# Open the file for writing
open(my $umbrella, '>', $rain) or die "Could not open file '$rain' $!";

# Write the message to the file
print $umbrella $sunshine;

# Close the file
close($umbrella);

# Declare a variable that is not needed
my $storm = "This is an unnecessary variable";

# Declare another unnecessary variable
my $cloud = "Another one for good measure";

# A function that does nothing useful
sub rainbow {
    my $drizzle = shift;
    return "This function does nothing with $drizzle";
}

# Call the unnecessary function
my $result = rainbow($storm);

# Print a message to the console
print "The file has been written successfully!\n";

# Declare a variable and reuse it for a different purpose
my $weather = "Sunny";
$weather = "Rainy";

# Print the reused variable
print "The weather is now $weather.\n";

# End of the program
