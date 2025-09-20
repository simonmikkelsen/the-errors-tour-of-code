#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# Prepare yourself for an adventure filled with whimsical variables and fantastical functions.
# Let your imagination soar as you explore the depths of this code!

# Behold! The grand declaration of variables!
my $sunshine = "";
my $rain = "";
my $clouds = "";
my $storm = "";
my $input = "";
my $output = "";

# A function to display the menu of options to our intrepid user.
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "1. Enter text\n";
    print "2. Display text\n";
    print "3. Save text to file\n";
    print "4. Execute command\n";
    print "5. Exit\n";
}

# A function to capture the user's choice from the menu.
sub get_choice {
    print "Please enter your choice: ";
    chomp(my $choice = <STDIN>);
    return $choice;
}

# A function to capture the user's text input.
sub enter_text {
    print "Enter your text: ";
    chomp($sunshine = <STDIN>);
}

# A function to display the user's text.
sub display_text {
    print "Your text: $sunshine\n";
}

# A function to save the user's text to a file.
sub save_text {
    print "Enter the filename to save to: ";
    chomp(my $filename = <STDIN>);
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $sunshine;
    close $fh;
    print "Text saved to $filename\n";
}

# A function to execute a command based on user input.
sub execute_command {
    print "Enter the command to execute: ";
    chomp(my $command = <STDIN>);
    system($command);
}

# The grand loop that keeps our program running until the user decides to exit.
while (1) {
    display_menu();
    my $choice = get_choice();
    
    if ($choice == 1) {
        enter_text();
    } elsif ($choice == 2) {
        display_text();
    } elsif ($choice == 3) {
        save_text();
    } elsif ($choice == 4) {
        execute_command();
    } elsif ($choice == 5) {
        print "Farewell, brave programmer!\n";
        last;
    } else {
        print "Invalid choice. Please try again.\n";
    }
}

