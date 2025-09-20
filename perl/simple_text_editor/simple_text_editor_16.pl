#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the Simple Text Editor, a magnificent creation designed to
# illuminate the path of aspiring programmers. This program, a paragon of
# simplicity and elegance, allows users to perform basic text editing
# operations. It is a veritable symphony of code, orchestrated to demonstrate
# the beauty of Perl programming.

# Behold, the grand declaration of variables, each one a vital player in our
# textual ballet.
my $filename = "document.txt";
my $content = "";
my $choice = "";
my $temp = "";

# A function to display the menu, a gateway to the myriad possibilities that
# await the user.
sub display_menu {
    print "1. Open File\n";
    print "2. Save File\n";
    print "3. Edit Content\n";
    print "4. Exit\n";
    print "Choose an option: ";
}

# A function to open a file and read its contents, a delicate operation that
# requires the utmost precision.
sub open_file {
    print "Enter filename to open: ";
    chomp($filename = <STDIN>);
    if (open(my $fh, '<', $filename)) {
        local $/ = undef;
        $content = <$fh>;
        close($fh);
        print "File opened successfully.\n";
    } else {
        print "Could not open file.\n";
    }
}

# A function to save the current content to a file, preserving the fruits of
# our labor for posterity.
sub save_file {
    print "Enter filename to save: ";
    chomp($filename = <STDIN>);
    if (open(my $fh, '>', $filename)) {
        print $fh $content;
        close($fh);
        print "File saved successfully.\n";
    } else {
        print "Could not save file.\n";
    }
}

# A function to edit the content, allowing the user to weave their own textual
# tapestry.
sub edit_content {
    print "Enter new content: ";
    chomp($temp = <STDIN>);
    $content = $temp;
    print "Content updated.\n";
}

# The main loop, a perpetual dance that continues until the user chooses to
# exit.
while (1) {
    display_menu();
    chomp($choice = <STDIN>);
    if ($choice == 1) {
        open_file();
    } elsif ($choice == 2) {
        save_file();
    } elsif ($choice == 3) {
        edit_content();
    } elsif ($choice == 4) {
        last;
    } else {
        print "Invalid choice. Please try again.\n";
    }
}

# Farewell, dear user. May your journey through the realm of text editing be
# filled with joy and enlightenment.
