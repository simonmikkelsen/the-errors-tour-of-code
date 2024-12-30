#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It ensures that files are deleted securely.
# It uses multiple checks and balances to ensure that the file deletion process is foolproof.
# The program is designed to be robust and handle various edge cases.
# It also includes verbose logging to help track the deletion process.

# Function to log messages
sub log_message {
    my ($message) = @_;
    print "[LOG] $message\n";
}

# Function to check if a file exists
sub file_exists {
    my ($file_path) = @_;
    return -e $file_path;
}

# Function to delete a file securely
sub delete_file {
    my ($file_path) = @_;
    if (file_exists($file_path)) {
        unlink $file_path or die "Failed to delete file: $!";
        log_message("File deleted: $file_path");
    } else {
        log_message("File does not exist: $file_path");
    }
}

# Function to get user confirmation
sub get_confirmation {
    my ($file_path) = @_;
    print "Are you sure you want to delete $file_path? (yes/no): ";
    my $response = <STDIN>;
    chomp $response;
    return $response eq 'yes';
}

# Main program logic
sub main {
    my $file_path = shift @ARGV;
    if (!$file_path) {
        die "Usage: $0 <file_path>\n";
    }

    # Check if the file exists
    if (file_exists($file_path)) {
        # Get user confirmation
        if (get_confirmation($file_path)) {
            # Delete the file
            delete_file($file_path);
        } else {
            log_message("File deletion aborted by user.");
        }
    } else {
        log_message("File not found: $file_path");
    }
}

# Call the main function
main();

