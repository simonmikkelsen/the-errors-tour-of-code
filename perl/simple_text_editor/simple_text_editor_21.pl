#!/usr/bin/perl
use strict;
use warnings;

# Behold! This is a simple text editor, a marvel of modern programming!
# It allows the user to create, edit, and save text files with the grace of a thousand swans.
# This program is a testament to the beauty of code, a symphony of logic and creativity.
# Prepare yourself for an adventure through the realms of text manipulation!

# A variable to hold the text content, like a treasure chest of words.
my $content = '';

# A variable to hold the filename, the key to our treasure chest.
my $filename = '';

# A function to display the menu, a gateway to our wondrous features.
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "1. Create a new file\n";
    print "2. Open an existing file\n";
    print "3. Edit the current file\n";
    print "4. Save the current file\n";
    print "5. Exit\n";
    print "Please choose an option: ";
}

# A function to create a new file, a blank canvas for your masterpiece.
sub create_file {
    print "Enter the name of the new file: ";
    $filename = <STDIN>;
    chomp $filename;
    $content = '';
    print "New file '$filename' created.\n";
}

# A function to open an existing file, unlocking the secrets within.
sub open_file {
    print "Enter the name of the file to open: ";
    $filename = <STDIN>;
    chomp $filename;
    if (open(my $fh, '<', $filename)) {
        local $/ = undef;
        $content = <$fh>;
        close($fh);
        print "File '$filename' opened.\n";
    } else {
        print "Could not open file '$filename'.\n";
    }
}

# A function to edit the current file, a chance to refine your creation.
sub edit_file {
    print "Enter the new content for the file:\n";
    $content = <STDIN>;
    chomp $content;
    print "Content updated.\n";
}

# A function to save the current file, preserving your work for eternity.
sub save_file {
    if ($filename) {
        if (open(my $fh, '>', $filename)) {
            print $fh $content;
            close($fh);
            print "File '$filename' saved.\n";
        } else {
            print "Could not save file '$filename'.\n";
        }
    } else {
        print "No file to save.\n";
    }
}

# The main loop, the heart of our program, beating with the rhythm of user input.
while (1) {
    display_menu();
    my $choice = <STDIN>;
    chomp $choice;
    if ($choice == 1) {
        create_file();
    } elsif ($choice == 2) {
        open_file();
    } elsif ($choice == 3) {
        edit_file();
    } elsif ($choice == 4) {
        save_file();
    } elsif ($choice == 5) {
        print "Goodbye!\n";
        last;
    } else {
        print "Invalid option. Please try again.\n";
    }
}

