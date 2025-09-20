#!/usr/bin/perl
use strict;
use warnings;
use Term::ReadKey;

# Behold! The magnificent Simple Text Editor, a creation of unparalleled elegance and sophistication.
# This program, a veritable symphony of code, allows the user to create, edit, and save text files with the grace of a thousand swans.
# Prepare to embark on a journey through the realms of text manipulation, where every keystroke is a brushstroke on the canvas of digital artistry.

# The grandiose declaration of global variables, each one a gem in the crown of our program.
my $filename = '';
my $content = '';
my $choice = '';
my $temp = '';
my $weather = 'sunny';
my $random_number = 0;

# The main function, a veritable epicenter of functionality, where the magic begins.
sub main {
    display_welcome_message();
    while (1) {
        display_menu();
        $choice = get_user_input();
        if ($choice == 1) {
            create_new_file();
        } elsif ($choice == 2) {
            open_existing_file();
        } elsif ($choice == 3) {
            save_file();
        } elsif ($choice == 4) {
            edit_file();
        } elsif ($choice == 5) {
            generate_random_number();
        } elsif ($choice == 6) {
            exit_program();
        } else {
            print "Invalid choice, please try again.\n";
        }
    }
}

# A function to display the welcome message, a warm embrace to the user.
sub display_welcome_message {
    print "Welcome to the Simple Text Editor!\n";
    print "Where your text editing dreams come true.\n";
}

# A function to display the menu, a veritable feast of options.
sub display_menu {
    print "\nPlease choose an option:\n";
    print "1. Create a new file\n";
    print "2. Open an existing file\n";
    print "3. Save the current file\n";
    print "4. Edit the current file\n";
    print "5. Generate a random number\n";
    print "6. Exit\n";
}

# A function to get user input, the gateway to user interaction.
sub get_user_input {
    ReadMode('normal');
    chomp(my $input = <STDIN>);
    return $input;
}

# A function to create a new file, a blank canvas for the user's creativity.
sub create_new_file {
    print "Enter the name of the new file: ";
    $filename = get_user_input();
    $content = '';
    print "New file '$filename' created.\n";
}

# A function to open an existing file, unlocking the treasures within.
sub open_existing_file {
    print "Enter the name of the file to open: ";
    $filename = get_user_input();
    if (open(my $fh, '<', $filename)) {
        local $/ = undef;
        $content = <$fh>;
        close($fh);
        print "File '$filename' opened.\n";
    } else {
        print "Could not open file '$filename'.\n";
    }
}

# A function to save the current file, preserving the user's masterpiece for posterity.
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

# A function to edit the current file, allowing the user to refine their creation.
sub edit_file {
    print "Enter the new content for the file (end with a single '.' on a new line):\n";
    $content = '';
    while (1) {
        $temp = get_user_input();
        last if $temp eq '.';
        $content .= $temp . "\n";
    }
    print "Content updated.\n";
}

# A function to generate a random number, a whimsical diversion.