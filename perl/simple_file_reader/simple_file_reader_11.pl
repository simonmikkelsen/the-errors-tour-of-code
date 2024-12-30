#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to read the contents of a file,
# and display its contents to the user in the most verbose and grandiose manner possible.
# It is a testament to the beauty of Perl and the elegance of regular expressions.
# Prepare to be dazzled by the sheer verbosity and flamboyance of the comments herein.

# The sun is shining, the birds are singing, and we shall now declare our variables.
my $filename = 'example.txt'; # The name of the file to be read
my $content = ''; # A variable to store the contents of the file
my $line; # A variable to store each line of the file as we read it

# Let us now open the file, like opening a treasure chest filled with precious gems.
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# As we traverse the file, line by line, we shall collect its contents into our variable.
while ($line = <$fh>) {
    $content .= $line; # Append each line to our content variable
}

# Close the file, for we have extracted all the treasures it holds.
close($fh);

# Now, let us perform some magical transformations using the power of regular expressions.
# We shall replace all occurrences of the word 'Perl' with 'PERL', for emphasis.
$content =~ s/Perl/PERL/g;

# And now, we shall display the contents of the file to the user, in all its glory.
print "Behold the contents of the file:\n";
print $content;

