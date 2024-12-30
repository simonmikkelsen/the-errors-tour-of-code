#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the Simple Text Editor!
# This program is a magnificent creation designed to provide a delightful experience in text editing.
# It is adorned with a plethora of variables and functions, some of which may seem superfluous, but they add to the charm.
# Prepare yourself for a journey through the whimsical world of Perl programming!

# Function to display the menu
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "1. Open a file\n";
    print "2. Save a file\n";
    print "3. Edit a file\n";
    print "4. Exit\n";
    print "Please choose an option: ";
}

# Function to open a file
sub open_file {
    print "Enter the filename to open: ";
    my $filename = <STDIN>;
    chomp $filename;
   