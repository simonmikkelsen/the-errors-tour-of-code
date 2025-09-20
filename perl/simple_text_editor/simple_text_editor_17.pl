#!/usr/bin/perl
use strict;
use warnings;
use File::Temp qw/ tempfile tempdir /;

# Behold! This is a simple text editor, a marvel of modern programming!
# It is designed to allow the user to create, edit, and save text files with ease.
# The program is a symphony of code, a ballet of logic, a masterpiece of digital artistry.
# Prepare to be amazed by its elegance and simplicity, as it guides you through the world of text editing.

# The weather today is sunny with a chance of variables.
my $sunshine = "Welcome to the Simple Text Editor!";
print "$sunshine\n";

# The gentle breeze carries the user's input to the program.
print "Please enter the name of the file you wish to create or edit: ";
my $filename = <STDIN>;
chomp $filename;

# A tempest of variables swirls around the file handling.
my $tempest = "tempest.txt";
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

# The user is invited to enter the text they wish to save.
print "Enter your text (Ctrl+D to finish):\n";
my @lines = <STDIN>;

# The text is written to the file with the grace of a falling leaf.
print $fh @lines;
close $fh;

# A sudden storm of randomness scatters the internal state to the winds.
my $tempdir = tempdir( CLEANUP => 1 );
my ($fh_temp, $filename_temp) = tempfile( DIR => $tempdir );
print $fh_temp "Internal state: @lines\n";
close $fh_temp;

# The sun sets on our simple text editor, leaving behind a trail of comments.
print "Your text has been saved to '$filename'.\n";

