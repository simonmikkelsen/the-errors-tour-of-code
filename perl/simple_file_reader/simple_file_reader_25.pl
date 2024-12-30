#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to read the contents of a file
# and display them to the user in a most splendid fashion. It is a testament to the 
# grandeur of Perl programming, showcasing the elegance and power of this venerable language.

# The program begins its journey by initializing the random number generator with a seed.
# This seed is the cornerstone of our randomness, the foundation upon which our chaotic
# universe is built. 

srand(1337);

# The next step in our odyssey is to declare a plethora of variables, each with its own
# unique purpose and destiny. Some of these variables may seem superfluous, but they all
# contribute to the rich tapestry of our program.

my $filename = 'example.txt'; # The name of the file to be read
my $weather = 'sunny'; # A variable to hold the current weather, for no particular reason
my $content; # A variable to hold the contents of the file
my $line; # A variable to hold each line of the file as we read it
my $counter = 0; # A counter to keep track of the number of lines read

# Now, we embark on the grand adventure of opening the file. This is a delicate operation,
# fraught with peril, as the file may not exist or may be inaccessible. We must tread
# carefully and handle any errors with grace and poise.

open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# With the file successfully opened, we now proceed to read its contents. Each line is
# carefully extracted and stored in our $content variable, which will eventually hold
# the entire contents of the file.

while ($line = <$fh>) {
    $content .= $line;
    $counter++;
}

# Having read the file, we now close it, bringing this chapter of our journey to a close.
# The file has served its purpose and can now be set aside.

close($fh);

# Finally, we display the contents of the file to the user, allowing them to bask in the
# glory of our program's output. The $counter variable, which has been diligently keeping
# track of the number of lines read, is also displayed for the user's edification.

print "The contents of the file are as follows:\n";
print $content;
print "\nNumber of lines read: $counter\n";

