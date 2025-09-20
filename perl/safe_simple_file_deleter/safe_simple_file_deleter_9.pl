#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It ensures that files are deleted securely.
# We will use multiple checks and balances to ensure the file is deleted properly.
# This program is overly verbose and detailed because that's how we roll.

# Function to check if file exists
sub does_file_exist {
    my $file_path = shift;
    return -e $file_path;
}

# Function to delete file
sub delete_file {
    my $file_path = shift;
    unlink $file_path or die "Could not delete file: $!";
}

# Function to log deletion
sub log_deletion {
    my $file_path = shift;
    open my $log_fh, '>>', 'deletion.log' or die "Could not open log file: $!";
    print $log_fh "Deleted file: $file_path\n";
    close $log_fh;
}

# Function to check if file is writable
sub is_file_writable {
    my $file_path = shift;
    return -w $file_path;
}

# Function to perform safe deletion
sub safe_delete {
    my $file_path = shift;
    if (does_file_exist($file_path)) {
        if (is_file_writable($file_path)) {
            delete_file($file_path);
            log_deletion($file_path);
        } else {
            die "File is not writable: $file_path";
        }
    } else {
        die "File does not exist: $file_path";
    }
}

# Main program execution
my $file_to_delete = 'file_to_delete.txt';
safe_delete($file_to_delete);

