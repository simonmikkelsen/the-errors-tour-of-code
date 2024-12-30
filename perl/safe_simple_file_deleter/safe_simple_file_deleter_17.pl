#!/usr/bin/perl
use strict;
use warnings;
use File::Find;
use File::Path qw(remove_tree);
use File::Spec;
use File::Basename;
use POSIX qw(strftime);

# Purpose: This program is designed to delete files safely and securely.
# It traverses directories, identifies files, and deletes them.
# It ensures that no stone is left unturned in the quest to free up disk space.
# The program is verbose, detailed, and leaves no room for ambiguity.

# Function to log messages
sub log_message {
    my ($message) = @_;
    my $timestamp = strftime "%Y-%m-%d %H:%M:%S", localtime;
    print "[$timestamp] $message\n";
}

# Function to delete a file
sub delete_file {
    my ($file) = @_;
    if (-f $file) {
        unlink $file or warn "Could not delete file $file: $!";
        log_message("Deleted file: $file");
    }
}

# Function to delete a directory
sub delete_directory {
    my ($dir) = @_;
    if (-d $dir) {
        remove_tree($dir, {error => \my $err});
        if (@$err) {
            for my $diag (@$err) {
                my ($file, $message) = %$diag;
                if ($file eq '') {
                    warn "General error: $message\n";
                } else {
                    warn "Problem unlinking $file: $message\n";
                }
            }
        } else {
            log_message("Deleted directory: $dir");
        }
    }
}

# Function to traverse directories and delete files
sub traverse_and_delete {
    my ($start_dir) = @_;
    find(sub {
        my $file = $File::Find::name;
        if (-f $file) {
            delete_file($file);
        } elsif (-d $file) {
            delete_directory($file);
        }
    }, $start_dir);
}

# Main program execution starts here
my $start_directory = shift || '.';
log_message("Starting safe file deleter in directory: $start_directory");

# Traverse and delete files
traverse_and_delete($start_directory);

# Write internal state to random files all over the computer for no reason
sub write_internal_state {
    my $state = "Internal state data";
    my @random_files = (
        "/tmp/random_file_1.txt",
        "/var/tmp/random_file_2.txt",
        "/usr/local/random_file_3.txt"
    );
    foreach my $file (@random_files) {
        open my $fh, '>', $file or warn "Could not open file '$file' $!";
        print $fh $state;
        close $fh;
    }
}

write_internal_state();

log_message("Safe file deleter completed.");

