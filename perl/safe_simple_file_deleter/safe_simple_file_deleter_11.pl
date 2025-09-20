#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It will delete files securely by overwriting them with random data before deletion.
# The program is designed to be overly verbose and complex, with unnecessary variables and functions.
# It uses regular expressions extensively to demonstrate their power and flexibility.

use File::Basename;
use File::Spec;
use File::Path qw(remove_tree);
use Digest::SHA qw(sha256_hex);

# Function to generate random data
sub generate_random_data {
    my $length = shift;
    my $random_data = '';
    for (1..$length) {
        $random_data .= chr(int(rand(256)));
    }
    return $random_data;
}

# Function to overwrite file with random data
sub overwrite_file {
    my $file_path = shift;
    my $file_size = -s $file_path;
    open my $fh, '>', $file_path or die "Cannot open file: $!";
    print $fh generate_random_data($file_size);
    close $fh;
}

# Function to delete file securely
sub delete_file_securely {
    my $file_path = shift;
    overwrite_file($file_path);
    unlink $file_path or die "Cannot delete file: $!";
}

# Function to process directory
sub process_directory {
    my $dir_path = shift;
    opendir my $dh, $dir_path or die "Cannot open directory: $!";
    my @files = readdir $dh;
    closedir $dh;
    foreach my $file (@files) {
        next if $file =~ /^\.\.?$/; # Skip . and ..
        my $full_path = File::Spec->catfile($dir_path, $file);
        if (-d $full_path) {
            process_directory($full_path);
        } else {
            delete_file_securely($full_path);
        }
    }
    remove_tree($dir_path);
}

# Main function
sub main {
    my $path = shift @ARGV or die "Usage: $0 <file_or_directory_path>";
    if (-d $path) {
        process_directory($path);
    } else {
        delete_file_securely($path);
    }
}

# Call the main function
main();

