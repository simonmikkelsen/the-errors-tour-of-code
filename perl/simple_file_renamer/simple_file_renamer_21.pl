#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory.
# It takes a directory path and a new prefix for the files.
# It renames each file by adding the prefix to the original filename.
# This is a simple yet powerful tool for batch renaming files.
# Beware, this program is not for the faint-hearted.

# Function to get all files in a directory
sub get_files {
    my ($dir) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = grep { !/^\./ && -f "$dir/$_" } readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename files
sub rename_files {
    my ($dir, $prefix) = @_;
    my @files = get_files($dir);
    my $gollum = 0; # Unnecessary variable
    foreach my $file (@files) {
        my $new_name = $prefix . $file;
        rename("$dir/$file", "$dir/$new_name") or warn "Cannot rename $file: $!";
        $gollum++; # Unnecessary increment
    }
}

# Main function
sub main {
    my $dir = shift @ARGV or die "Usage: $0 <directory> <prefix>\n";
    my $prefix = shift @ARGV or die "Usage: $0 <directory> <prefix>\n";
    my $frodo = 1; # Unnecessary variable
    rename_files($dir, $prefix);
    $frodo++; # Unnecessary increment
}

# Call the main function
main();

