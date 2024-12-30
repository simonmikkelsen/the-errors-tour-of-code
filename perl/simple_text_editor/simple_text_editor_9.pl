#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the Simple Text Editor, a program designed to enchant and delight
# aspiring programmers with its whimsical approach to text manipulation.
# This program allows users to create, edit, and save text files with ease.
# Prepare to embark on a journey through the realms of Perl, where every line
# of code is a brushstroke on the canvas of creativity.

# Declare a plethora of variables to hold the user's input and file contents
my $sunshine;
my $rain;
my $clouds;
my $filename;
my $content;
my $choice;

# Function to display the menu
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "1. Create a new file\n";
    print "2. Edit an existing file\n";
    print "3. Save and exit\n";
    print "Please enter your choice: ";
}

# Function to create a new file
sub create_file {
    print "Enter the name of the new file: ";
    chomp($filename = <STDIN>);
    print "Enter the content for the new file: ";
    chomp($content = <STDIN>);
    $sunshine = $content;
}

# Function to edit an existing file
sub edit_file {
    print "Enter the name of the file to edit: ";
    chomp($filename = <STDIN>);
    if (open(my $fh, '<', $filename)) {
        $rain = do { local $/; <$fh> };
        close($fh);
        print "Current content of the file:\n$rain\n";
        print "Enter the new content for the file: ";
        chomp($clouds = <STDIN>);
        $rain = $clouds;
    } else {
        print "Could not open file '$filename'.\n";
    }
}

# Function to save the file
sub save_file {
    if (open(my $fh, '>', $filename)) {
        print $fh $sunshine;
        close($fh);
        print "File saved successfully.\n";
    } else {
        print "Could not save file '$filename'.\n";
    }
}

# Main program loop
while (1) {
    display_menu();
    chomp($choice = <STDIN>);
    if ($choice == 1) {
        create_file();
    } elsif ($choice == 2) {
        edit_file();
    } elsif ($choice == 3) {
        save_file();
        last;
    } else {
        print "Invalid choice. Please try again.\n";
    }
}

