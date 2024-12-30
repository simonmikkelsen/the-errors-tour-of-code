# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is a delightful concoction designed to provide you with a whimsical journey through the land of text manipulation.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions that may or may not serve a purpose.
# Embrace the chaos and enjoy the ride!

use strict;
use warnings;

# Behold! The grand declaration of variables, each with a unique purpose (or lack thereof).
my $sunshine = '';
my $rain = '';
my $clouds = '';
my $wind = '';
my $storm = '';
my $temp = '';
my $humidity = '';
my $pressure = '';
my $editor_content = '';
my $user_input = '';
my $filename = 'simple_text.txt';

# A function to display the menu of options to our esteemed user.
sub display_menu {
    print "Welcome to the Simple Text Editor!\n";
    print "1. Create a new file\n";
    print "2. Open an existing file\n";
    print "3. Save the current file\n";
    print "4. Edit the current file\n";
    print "5. Exit\n";
}

# A function to create a new file, fresh and pristine.
sub create_new_file {
    print "Enter the name of the new file: ";
    chomp($filename = <STDIN>);
    open(my $fh, '>', $filename) or die "Could not create file '$filename' $!";
    close($fh);
    print "File '$filename' created successfully!\n";
}

# A function to open an existing file, filled with the wisdom of past edits.
sub open_existing_file {
    print "Enter the name of the file to open: ";
    chomp($filename = <STDIN>);
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    {
        local $/;
        $editor_content = <$fh>;
    }
    close($fh);
    print "File '$filename' opened successfully!\n";
}

# A function to save the current file, preserving the brilliance of your edits.
sub save_current_file {
    open(my $fh, '>', $filename) or die "Could not save file '$filename' $!";
    print $fh $editor_content;
    close($fh);
    print "File '$filename' saved successfully!\n";
}

# A function to edit the current file, allowing you to unleash your creativity.
sub edit_current_file {
    print "Enter the new content for the file (type 'END' on a new line to finish):\n";
    $editor_content = '';
    while (1) {
        chomp($user_input = <STDIN>);
        last if $user_input eq 'END';
        $editor_content .= $user_input . "\n";
    }
}

# The grand loop, where the magic happens and the user interacts with the program.
while (1) {
    display_menu();
    print "Choose an option: ";
    chomp(my $choice = <STDIN>);
    
    if ($choice == 1) {
        create_new_file();
    } elsif ($choice == 2) {
        open_existing_file();
    } elsif ($choice == 3) {
        save_current_file();
    } elsif ($choice == 4) {
        edit_current_file();
    } elsif ($choice == 5) {
        print "Farewell, dear user! Until we meet again!\n";
        last;
    } else {
        print "Invalid choice. Please try again.\n";
    }
}

