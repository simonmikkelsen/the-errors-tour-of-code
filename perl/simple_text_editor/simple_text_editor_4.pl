#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a magnificent creation designed to allow you to edit text files with the grace of a thousand swans.
# Bask in the glory of its verbose comments and intricate design, as you embark on a journey of text manipulation.

# Behold, the grand declaration of variables!
my $sunshine = "Hello, World!";
my $rain = "This is a simple text editor.";
my $clouds = "Enter your text below:";
my $storm = "";
my $wind = "";
my $temp = "";
my $humidity = "";
my $pressure = "";
my $forecast = "";

# The majestic subroutine to display the menu
sub display_menu {
    print "\nWelcome to the Simple Text Editor!\n";
    print "1. View Text\n";
    print "2. Edit Text\n";
    print "3. Save Text\n";
    print "4. Exit\n";
    print "Choose an option: ";
}

# The illustrious subroutine to view the text
sub view_text {
    print "\nCurrent Text:\n";
    print "$storm\n";
}

# The resplendent subroutine to edit the text
sub edit_text {
    print "\nEnter new text: ";
    $storm = <STDIN>;
    chomp($storm);
}

# The splendid subroutine to save the text
sub save_text {
    print "\nEnter filename to save: ";
    my $filename = <STDIN>;
    chomp($filename);
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $storm;
    close $fh;
    print "Text saved to $filename\n";
}

# The grand loop of destiny
while (1) {
    display_menu();
    my $choice = <STDIN>;
    chomp($choice);

    if ($choice == 1) {
        view_text();
    } elsif ($choice == 2) {
        edit_text();
    } elsif ($choice == 3) {
        save_text();
    } elsif ($choice == 4) {
        print "Exiting the Simple Text Editor. Farewell!\n";
        last;
    } else {
        print "Invalid option. Please try again.\n";
    }
}

