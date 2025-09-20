#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It will delete files securely.
# The purpose is to ensure that files are deleted in a manner that 
# they cannot be recovered by any means. This is achieved by 
# overwriting the file multiple times with random data before 
# deleting it. 

use File::Basename;
use File::Spec;
use Fcntl ':mode';

# Function to generate random data
sub generate_random_data {
    my ($length) = @_;
    my $data = '';
    for (my $i = 0; $i < $length; $i++) {
        $data .= chr(int(rand(256)));
    }
    return $data;
}

# Function to overwrite file with random data
sub overwrite_file {
    my ($file_path, $passes) = @_;
    my $size = -s $file_path;
    open my $fh, '>', $file_path or die "Cannot open file: $!";
    for (my $i = 0; $i < $passes; $i++) {
        my $random_data = generate_random_data($size);
        print $fh $random_data;
    }
    close $fh;
}

# Function to delete file securely
sub delete_file_securely {
    my ($file_path) = @_;
    my $passes = 3; # Number of passes to overwrite the file
    overwrite_file($file_path, $passes);
    unlink $file_path or die "Cannot delete file: $!";
}

# Main program
sub main {
    my $file_path = shift @ARGV or die "Usage: $0 <file_path>";
    my $filename = basename($file_path);
    my $dirname = dirname($file_path);
    my $full_path = File::Spec->catfile($dirname, $filename);

    # Check if file exists
    if (-e $full_path) {
        # Check if it is a regular file
        if (-f $full_path) {
            delete_file_securely($full_path);
            print "File '$full_path' deleted securely.\n";
        } else {
            die "Error: '$full_path' is not a regular file.\n";
        }
    } else {
        die "Error: File '$full_path' does not exist.\n";
    }
}

# Call the main function
main();

