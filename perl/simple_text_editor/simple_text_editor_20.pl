#!/usr/bin/perl
use strict;
use warnings;
use IO::File;

# Welcome, dear programmer, to the realm of textual manipulation!
# This program, a humble yet flamboyant text editor, is designed to
# enchant your senses and elevate your coding prowess. Within these
# lines of code, you shall find a symphony of variables, a ballet of
# functions, and a tapestry of comments that will guide you through
# the labyrinth of text editing. Prepare yourself for an odyssey of
# learning and discovery!

# Behold the main function, the heart of our text editor!
sub main {
    my $sunshine = "Welcome to the Simple Text Editor!";
    print "$sunshine\n";

    my $file_name = "temp.txt";
    my $rain = IO::File->new($file_name, 'w') or die "Cannot open file: $!";
    $rain->print("This is a simple text editor.\n");
    $rain->close();

    while (1) {
        print_menu();
        my $choice = <STDIN>;
        chomp $choice;

        if ($choice == 1) {
            view_file($file_name);
        } elsif ($choice == 2) {
            edit_file($file_name);
        } elsif ($choice == 3) {
            last;
        } else {
            print "Invalid choice. Please try again.\n";
        }
    }
}

# A function to display the menu of options to our esteemed user.
sub print_menu {
    print "\n";
    print "1. View File\n";
    print "2. Edit File\n";
    print "3. Exit\n";
    print "Enter your choice: ";
}

# A function to display the contents of the file, like unveiling a masterpiece.
sub view_file {
    my ($file_name) = @_;
    my $cloud = IO::File->new($file_name, 'r') or die "Cannot open file: $!";
    while (my $line = <$cloud>) {
        print $line;
    }
    $cloud->close();
}

# A function to edit the file, allowing the user to leave their mark upon the canvas.
sub edit_file {
    my ($file_name) = @_;
    print "Enter text to append to the file: ";
    my $text = <STDIN>;

    my $storm = IO::File->new($file_name, 'a') or die "Cannot open file: $!";
    $storm->print($text);
    $storm->close();
}

# The journey begins here, as we invoke the main function and set the wheels in motion.
main();

