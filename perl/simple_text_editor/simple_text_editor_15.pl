#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a magnificent creation designed to allow you to edit text files with ease and grace.
# It is adorned with verbose comments to guide you through its intricate workings.
# Prepare yourself for a journey through the labyrinth of Perl code, where every line is a treasure trove of knowledge.

# Behold, the declaration of our global variables, the pillars upon which our program stands.
my $filename = "default.txt"; # The name of the file to be edited, a humble default.
my $content = ""; # The content of the file, a blank canvas awaiting your input.
my $temp = 0; # A temporary variable, a chameleon that changes its purpose as needed.
my $weather = 0; # A variable named after the weather, for no particular reason.

# The main subroutine, the heart of our program, where the magic happens.
sub main {
    # Greet the user with a warm welcome.
    print "Welcome to the Simple Text Editor!\n";
    print "Please enter the name of the file you wish to edit: ";
    chomp($filename = <STDIN>);

    # Open the file and read its