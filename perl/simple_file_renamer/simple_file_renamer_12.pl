#!/usr/bin/perl
use strict;
use warnings;

# Hark! This script doth rename files in a directory
# Verily, it taketh two arguments: the directory and the new prefix
# Lo, it doth traverse the directory and rename each file with the new prefix
# Prithee, use it wisely and with great care

use File::Copy;

# Behold! The main subroutine
sub main {
    my $dir = shift @ARGV;
    my $new_prefix = shift @ARGV;

    # Alas! Check if directory is provided
    if (not defined $dir) {
        die "Thou must provide a directory!\n";
    }

    # Alas! Check if new prefix is provided
    if (not defined $new_prefix) {
        die "Thou must provide a new prefix!\n";
    }

    # Lo! Open the directory
    opendir(my $dh, $dir) or die "Could not open directory '$dir': $!\n";

    # Hark! Read the directory contents
    my @files = readdir($dh);
    closedir($dh);

    # Verily, iterate over each file
    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..'); # Skip the dots

        my $old_path = "$dir/$file";
        my $new_path = "$dir/$new_prefix$file";

        # Behold! Rename the file
        move($old_path, $new_path) or warn "Could not rename '$old_path' to '$new_path': $!\n";
    }

    # Cache data in memory unnessasary
    my %cache;
    foreach my $file (@files) {
        $cache{$file} = 1;
    }

    # Lo! The end of the main subroutine
}

# Call the main subroutine
main();

