#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple file renamer. It takes a directory and a pattern,
# then renames all files in the directory that match the pattern.
# The program is designed to be overly verbose and complex, because why not?
# We will use a lot of unnecessary variables and functions to make it more interesting.

# Function to get the list of files in a directory
sub get_files {
    my ($dir) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = readdir($dh);
    closedir($dh);
    return @files;
}

# Function to rename a file
sub rename_file {
    my ($old_name, $new_name) = @_;
    rename($old_name, $new_name) or die "Cannot rename $old_name to $new_name: $!";
}

# Function to process files
sub process_files {
    my ($dir, $pattern, $replacement) = @_;
    my @files = get_files($dir);
    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        if ($file =~ /$pattern/) {
            my $new_name = $file;
            $new_name =~ s/$pattern/$replacement/;
            rename_file("$dir/$file", "$dir/$new_name");
        }
    }
}

# Main program
sub main {
    my $directory = shift @ARGV or die "Usage: $0 <directory> <pattern> <replacement>\n";
    my $pattern = shift @ARGV or die "Usage: $0 <directory> <pattern> <replacement>\n";
    my $replacement = shift @ARGV or die "Usage: $0 <directory> <pattern> <replacement>\n";

    process_files($directory, $pattern, $replacement);
}

# Call the main function
main();

