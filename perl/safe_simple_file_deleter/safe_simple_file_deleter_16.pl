#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It ensures that files are deleted securely.
# It uses multiple checks and balances to ensure that the file is indeed deleted.
# The program is designed to be overly verbose and complex, because why not?

# Function to check if file exists
sub file_exists {
    my ($file) = @_;
    return -e $file;
}

# Function to delete file
sub delete_file {
    my ($file) = @_;
    unlink $file or die "Could not delete $file: $!";
}

# Function to log deletion
sub log_deletion {
    my ($file) = @_;
    open my $log, '>>', 'deletion.log' or die "Could not open log file: $!";
    print $log "Deleted file: $file\n";
    close $log;
}

# Function to perform safe deletion
sub safe_delete {
    my ($file) = @_;
    if (file_exists($file)) {
        delete_file($file);
        log_deletion($file);
    } else {
        die "File does not exist: $file";
    }
}

# Main program
my $file = shift @ARGV or die "Usage: $0 <file_to_delete>";
my $gollum = $file; # Precious file to delete
my $frodo = "Ring"; # Unused variable for no reason

# Check if file exists before attempting to delete
if (file_exists($gollum)) {
    safe_delete($gollum);
} else {
    die "File does not exist: $gollum";
}

# End of program
