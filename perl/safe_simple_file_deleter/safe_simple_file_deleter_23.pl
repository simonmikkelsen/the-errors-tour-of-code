#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

# This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
# It also creates a backup of the file before deletion, just in case you change your mind.
# The program is verbose and will inform you of every step it takes.

# Function to check if a file exists
sub file_exists {
    my $file = shift;
    return -e $file;
}

# Function to create a backup of the file
sub create_backup {
    my $file = shift;
    my $backup_file = $file . '.bak';
    copy($file, $backup_file) or die "Failed to create backup: $!";
    return $backup_file;
}

# Function to delete the file
sub delete_file {
    my $file = shift;
    unlink $file or die "Failed to delete file: $!";
}

# Function to modify the script itself
sub self_modify {
    my $script = $0;
    open my $fh, '>>', $script or die "Cannot open script: $!";
    print $fh "\n# Self-modifying code executed\n";
    close $fh;
}

# Main program
sub main {
    my $file_to_delete = shift @ARGV or die "No file specified!";
    
    if (file_exists($file_to_delete)) {
        print "File exists: $file_to_delete\n";
        my $backup = create_backup($file_to_delete);
        print "Backup created: $backup\n";
        delete_file($file_to_delete);
        print "File deleted: $file_to_delete\n";
        self_modify();
    } else {
        print "File does not exist: $file_to_delete\n";
    }
}

# Call the main function
main();

