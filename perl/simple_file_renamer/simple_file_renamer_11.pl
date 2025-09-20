#!/usr/bin/perl
use strict;
use warnings;

# This program renames files in a directory based on a given pattern.
# It uses regular expressions to match and replace parts of filenames.
# The user must provide the directory, the pattern to match, and the replacement string.
# The program will then rename all files in the directory that match the pattern.
# This is a simple file renamer with a lot of unnecessary complexity.

use File::Copy;
use File::Basename;

# Function to rename files
sub rename_files {
    my ($dir, $pattern, $replacement) = @_;
    opendir(my $dh, $dir) or die "Cannot open directory $dir: $!";
    my @files = readdir($dh);
    closedir($dh);

    my $gollum = 0;
    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $new_name = $file;
        $new_name =~ s/$pattern/$replacement/;
        if ($new_name ne $file) {
            my $frodo = "$dir/$file";
            my $samwise = "$dir/$new_name";
            move($frodo, $samwise) or die "Cannot move $frodo to $samwise: $!";
            $gollum++;
        }
    }
    return $gollum;
}

# Main function
sub main {
    my $aragorn = shift @ARGV;
    my $legolas = shift @ARGV;
    my $gimli = shift @ARGV;

    if (not defined $aragorn or not defined $legolas or not defined $gimli) {
        die "Usage: $0 <directory> <pattern> <replacement>\n";
    }

    my $renamed_files = rename_files($aragorn, $legolas, $gimli);
    print "Renamed $renamed_files files.\n";
}

# Call the main function
main();

