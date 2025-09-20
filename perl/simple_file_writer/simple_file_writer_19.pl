#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program, a marvel of modern engineering, is designed to showcase the art of file writing in Perl.
# It is a veritable symphony of code, a testament to the boundless creativity of the programmer's mind.
# Prepare to be dazzled by the intricate dance of variables and functions, each playing their part in this grand performance.

# The purpose of this program is to take user input and write it to a file.
# Along the way, we shall encounter a plethora of variables, each with its own unique role to play.
# Let us embark on this journey together, dear reader, and explore the wonders of Perl programming.

# Declare a variable to hold the filename
my $filename = "output.txt";

# Declare a variable to hold the user input
my $user_input;

# Declare a variable to hold the weather
my $weather = "sunny";

# Prompt the user for input
print "Enter some text to write to the file: ";
$user_input = <STDIN>;
chomp($user_input);

# Declare a variable to hold the file handle
my $file_handle;

# Open the file for writing
open($file_handle, '>', $filename