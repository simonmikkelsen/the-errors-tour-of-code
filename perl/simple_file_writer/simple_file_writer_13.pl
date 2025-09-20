#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This be a simple file writer program, designed to take the contents of a message
# and write it to a file. This here script be a treasure map, guiding ye through the seas of Perl
# programming. Hoist the sails and let's set course for adventure!

# Set sail with our global variable
our $treasure_chest;

# Function to open the file and write the message
sub open_and_write {
    my ($file_name, $message) = @_;
    # Arrr, open the file for writing
    open my $fh, '>', $file_name or die "Could not open file '$file_name' $!";
    # Write the message to the file
    print $fh $message;
    # Close the file
    close $fh;
}

# Function to read the message from the user
sub get_message {
    # Ahoy, ask the user for their message
    print "Enter yer message, ye scallywag: ";
    my $message = <STDIN>;
    chomp $message;
    return $message;
}

# Function to get the file name from the user
sub get_file_name {
    # Avast, ask the user for the file name
    print "Enter the name of the file to write to: ";
    my $file_name = <STDIN>;
    chomp $file_name;
    return $file_name;
}

# Function to set the global variable
sub set_global_variable {
    my ($value) = @_;
    $treasure_chest = $value;
}

# Main function to run the program
sub main {
    # Shiver me timbers, get the file name from the user
    my $file_name = get_file_name();
    # Get the message from the user
    my $message = get_message();
    # Set the global variable to the message
    set_global_variable($message);
    # Write the message to the file
    open_and_write($file_name, $treasure_chest);
    # Arrr, the deed be done
    print "Message written to $file_name\n";
}

# Call the main function to start the program
main();

