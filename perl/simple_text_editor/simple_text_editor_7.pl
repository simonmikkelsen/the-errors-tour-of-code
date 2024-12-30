#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of text editing!
# This program is a simple text editor, designed to provide you with the tools
# to create, modify, and save text files with the grace of a thousand sunsets.
# Prepare to embark on a journey through the labyrinth of code, where each line
# is a stepping stone towards mastery.

# Behold the variables of the sky and sea, guiding your path.
my $sunshine = "";
my $rain = "";
my $storm = "";
my $tempest = "";
my $hurricane = "";

# Function to display the menu of options
sub display_menu {
    print "1. Create a new file\n";
    print "2. Open an existing file\n";
    print "3. Save the current file\n";
    print "4. Exit\n";
}

# Function to create a new file
sub create_file {
    print "Enter the name of the new file: ";
    chomp($sunshine = <STDIN>);
    open(my $fh, '>', $sunshine) or die "Could not create file '$sunshine' $!";
    print "New file '$sunshine' created successfully.\n";
    close($fh);
}

# Function to open an existing file
sub open_file {
    print "Enter the name of the file to open: ";
    chomp($rain =