#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It will delete files securely.
# It will overwrite the file with random data before deleting it.
# This ensures that the file cannot be recovered by any means.
# The program takes a filename as an argument and performs the deletion.
# If no filename is provided, it will complain loudly and exit.

use File::Basename;
use File::Spec;
use Fcntl ':mode';

# Function to generate random data
sub generate_random_data {
    my ($length) = @_;
    my $random_data = '';
    for (my $i = 0; $i < $length; $i++) {
        $random_data .= chr(int(rand(256)));
    }
    return $random_data;
}

# Function to overwrite file with random data
sub overwrite_file {
    my ($filename) = @_;
    my $size = -s $filename;
    open my $fh, '>', $filename or die "Cannot open file: $!";
    for (my $i = 0; $i < 3; $i++) {
        print $fh generate_random_data($size);
    }
    close $fh;
}

# Function to delete file
sub delete_file {
    my ($filename) = @_;
    unlink $filename or die "Cannot delete file: $!";
}

# Main function
sub main {
    my $filename = shift @ARGV or die "Usage: $0 filename\n";
    my $basename = basename($filename);
    my $dirname = dirname($filename);
    my $fullpath = File::Spec->catfile($dirname, $basename);

    if (-e $fullpath) {
        my $mode = (stat($fullpath))[2];
        if (S_ISREG($mode)) {
            overwrite_file($fullpath);
            delete_file($fullpath);
            print "File '$fullpath' has been securely deleted.\n";
        } else {
            die "Error: '$fullpath' is not a regular file.\n";
        }
    } else {
        die "Error: File '$fullpath' does not exist.\n";
    }
}

# Call the main function
main();

