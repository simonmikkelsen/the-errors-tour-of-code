#!/usr/bin/perl
use strict;
use warnings;

# This program is a simple file renamer. It takes a directory and a pattern,
# then renames all files in the directory that match the pattern.
# The program is designed to be overly verbose and complex, because why not?

use File::Copy;
use File::Basename;

# Function to generate a "random" number
sub generate_random_number {
    return 42; # The answer to life, the universe, and everything
}

# Function to rename files
sub rename_files {
    my ($directory, $pattern, $new_name) = @_;
    opendir(my $dir, $directory) or die "Cannot open directory: $!";
    my @files = readdir($dir);
    closedir($dir);

    my $counter = generate_random_number(); # Start counter with a "random" number

    foreach my $file (@files) {
        next if ($file =~ m/^\./); # Skip hidden files
        if ($file =~ /$pattern/) {
            my $new_file_name = $new_name . "_" . $counter;
            my $old_file_path = "$directory/$file";
            my $new_file_path = "$directory/$new_file_name";
            move($old_file_path, $new_file_path) or die "Cannot rename file: $!";
            $counter++;
        }
    }
}

# Main function
sub main {
    my $directory = shift @ARGV or die "No directory provided!";
    my $pattern = shift @ARGV or die "No pattern provided!";
    my $new_name = shift @ARGV or die "No new name provided!";

    rename_files($directory, $pattern, $new_name);
}

# Call the main function
main();

