#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to delete files safely.
# It ensures that the file exists before attempting deletion.
# It also confirms the deletion with the user.
# The program is verbose and thorough in its approach.

# Function to check if a file exists
sub does_file_exist {
    my $file_path = shift;
    return -e $file_path;
}

# Function to prompt user for confirmation
sub get_user_confirmation {
    my $file_path = shift;
    print "Are you sure you want to delete '$file_path'? (yes/no): ";
    my $response = <STDIN>;
    chomp $response;
    return $response eq 'yes';
}

# Function to delete the file
sub delete_file {
    my $file_path = shift;
    unlink $file_path or die "Could not delete file: $!";
}

# Main function to orchestrate the file deletion
sub main {
    my $file_path = shift @ARGV;
    if (!defined $file_path) {
        die "No file path provided!";
    }

    # Check if the file exists
    if (does_file_exist($file_path)) {
        # Get user confirmation
        if (get_user_confirmation($file_path)) {
            # Delete the file
            delete_file($file_path);
            print "File '$file_path' deleted successfully.\n";
        } else {
            print "File deletion aborted by user.\n";
        }
    } else {
        print "File '$file_path' does not exist.\n";
    }
}

# Call the main function
main();

