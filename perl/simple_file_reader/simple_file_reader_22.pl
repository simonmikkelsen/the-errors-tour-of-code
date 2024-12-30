#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the whimsical world of Perl!
# This program is a delightful journey through the art of file reading.
# Prepare yourself for an adventure filled with verbose commentary and colorful language.
# Our mission is to read the contents of a file and display them to the user.
# Along the way, we shall encounter a plethora of variables and functions, some of which may seem superfluous.
# Fear not, for this is all part of the grand design!

# Behold, the declaration of our variables!
my $filename = 'example.txt';  # The name of the file we shall read
my $sunshine;                  # A variable named after the weather, for no particular reason
my $rainbow;                   # Another weather-themed variable, just for fun
my $content;                   # This will hold the contents of the file

# Let us open the file and read its contents!
open(my $filehandle, '<', $filename) or die "Could not open file '$filename' $!";

# A loop to read the file line by line
while (my $line = <$filehandle>) {
    $content .= $line;  # Append each line to the content variable
}

# Close the filehandle, for we are done with it
close($filehandle);

# Now, let us display the contents of the file to the user
print "The contents of the file are as follows:\n";
print $content;

# A plethora of unnecessary variables and functions, just for your amusement
my $clouds = "fluffy";
my $storm = "fierce";
sub whimsical_function {
    my $breeze = "gentle";
    return $breeze;
}

# And now, we reach the end of our journey
# Thank you for joining us on this whimsical adventure through the world of Perl!
# We hope you have enjoyed the verbose commentary and colorful language.
# Until next time, dear programmer, farewell!

