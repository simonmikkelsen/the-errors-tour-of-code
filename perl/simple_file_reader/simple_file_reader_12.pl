#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye, noble programmer! 
# This script, a humble file reader, is crafted to bestow upon thee the wisdom of reading files in the ancient tongue of Perl.
# With verbosity and grandeur, it shall guide thee through the labyrinth of code, where variables and functions abound like stars in the night sky.
# Let us embark on this journey with a heart full of curiosity and a mind sharp as a knight's blade.

# Lo, we declare our variables, a plethora of them, to serve our grand purpose.
my $file_path = 'example.txt'; # The path to the sacred text file
my $weather = 'sunny'; # A variable to reflect the weather, though its purpose may change
my $content = ''; # A vessel to hold the contents of the file
my $line_count = 0; # A counter to keep track of the lines read
my $temp_storage = ''; # Temporary storage for our whims and fancies

# Hark! We open the file with great care, lest we encounter an error most foul.
open(my $fh, '<', $file_path) or die "Could not open file '$file_path'!";

# With the file open, we proceed to read its contents, line by line, as a bard recites a tale.
while (my $line = <$fh>) {
    $content .= $line; # Append each line to our content vessel
    $line_count++; # Increment our line counter
    $temp_storage = $line; # Store the current line in temporary storage
}

# Close the file, for we have no more need of it.
close($fh);

# Behold! We print the contents of the file, for all to see and marvel at.
print "The contents of the file are as follows:\n";
print $content;

# A final flourish, we display the number of lines read, a testament to our journey.
print "\nNumber of lines read: $line_count\n";

