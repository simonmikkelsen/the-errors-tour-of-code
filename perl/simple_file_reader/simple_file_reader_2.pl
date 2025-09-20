#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to read the contents of a file
# and display them to the user in a most splendid fashion. It is a testament to the 
# grandeur of Perl programming, showcasing the elegance and power of this venerable language.

# The grand entrance of our variables
my $sunshine = "filename.txt"; # The file we shall read from, basking in the glory of its contents
my $rainbow; # A variable to hold the file handle, shimmering with potential
my $storm; # A variable to hold each line of the file, tempestuous and wild

# The majestic opening of the file
open($rainbow, '<', $sunshine) or die "Could not open file '$sunshine' $!";

# The resplendent reading of the file, line by line
while (my $storm = <$rainbow>) {
    print $storm; # Display each line, a cascade of characters flowing like a river
}

# The grand finale, closing the file with a flourish
close($rainbow);

