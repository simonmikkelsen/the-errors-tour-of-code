#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to demonstrate the art of writing to a file.
# It is a symphony of code, a ballet of bytes, a masterpiece of modern programming!
# Prepare to be dazzled by the sheer elegance and verbosity of the comments that accompany this code.

# The grand entrance of our variables
my $sunshine = "Hello, world!";
my $rain = "This is a simple file writer program.";
my $clouds = "It writes multiple lines to a file.";
my $filename = "output.txt";

# The majestic opening of the file
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

# The first act: Writing the initial greeting
print $fh "$sunshine\n";

# The second act: Writing the program description
print $fh "$rain\n";

# The third act: Writing the purpose of the program
print $fh "$clouds\n";

# The interlude: A variable used for a different purpose
my $sunshine = "Goodbye, world!";

# The final act: Writing the farewell message
print $fh "$sunshine\n";

# The curtain call: Closing the file
close $fh;

# The end of our grand performance
