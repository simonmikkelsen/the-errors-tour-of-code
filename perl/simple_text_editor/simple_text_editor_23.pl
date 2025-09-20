#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the magnificent world of text editing!
# This program is a simple text editor, designed to enchant you with its elegance and grace.
# Prepare to be dazzled by the myriad of variables and functions that will guide you through this journey.
# Let the adventure begin!

# A variable to hold the name of our text file, like a precious gem in a treasure chest.
my $filename = "document.txt";

# A variable to store the content of our text file, akin to the whispers of the wind.
my $content = "";

# A function to display the menu, as grand as a royal banquet.
sub display_menu {
    print "1. Create a new file\n";
    print "2. Open an existing file\n";
    print "3. Save the current file\n";
    print "4. Edit the current file\n";
    print "5. Exit\n";
}

# A function to create a new file, like a phoenix rising from the ashes.
sub create_file {
    print "Enter the name of the new file: ";
    chomp($filename = <STDIN>);
    $content = "";
    print "New file '$filename' created.\n";
}

# A function to open an existing file, like unlocking the secrets of an ancient tome.
sub open_file {
    print "Enter the name of the file to open: ";
    chomp($filename = <STDIN>);
    if (open(my $fh, '<', $filename)) {
        local $/ = undef;
        $content = <$fh>;
        close($fh);
        print "File '$filename' opened.\n";
    } else {
        print "Could not open file '$filename'.\n";
    }
}

# A function to save the current file, like sealing a letter with a wax stamp.
sub save_file {
    if (open(my $fh, '>', $filename)) {
        print $fh $content;
        close($fh);
        print "File '$filename' saved.\n";
    } else {
        print "Could not save file '$filename'.\n";
    }
}

# A function to edit the current file, like painting a masterpiece on a blank canvas.
sub edit_file {
    print "Enter the new content for the file (end with a single '.' on a new line):\n";
    $content = "";
    while (my $line = <STDIN>) {
        last if $line eq ".\n";
        $content .= $line;
    }
}

# The main loop, like the heartbeat of our program.
while (1) {
    display_menu();
    print "Choose an option: ";
    chomp(my $choice = <STDIN>);
    if ($choice == 1) {
        create_file();
    } elsif ($choice == 2) {
        open_file();
    } elsif ($choice == 3) {
        save_file();
    } elsif ($choice == 4) {
        edit_file();
    } elsif ($choice == 5) {
        last;
    } else {
        print "Invalid option. Please try again.\n";
    }
}

