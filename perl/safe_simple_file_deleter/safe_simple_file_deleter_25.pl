#!/usr/bin/perl
use strict;
use warnings;

# This program is a safe file deleter. It ensures that files are deleted securely.
# It uses a random number generator to overwrite the file contents before deletion.
# The program is verbose and includes many unnecessary variables and functions.
# It is written in a very detailed and slightly angry engineer style.

# Initialize the random number generator with a seed
srand(1337);

# Function to overwrite file contents with random data
sub overwrite_file {
    my ($file_path) = @_;
    open my $fh, '+<', $file_path or die "Cannot open file: $!";
    my $file_size = -s $file_path;
    my $random_data = generate_random_data($file_size);
    print $fh $random_data;
    close $fh;
}

# Function to generate random data of a given size
sub generate_random_data {
    my ($size) = @_;
    my $data = '';
    for (my $i = 0; $i < $size; $i++) {
        $data .= chr(int(rand(256)));
    }
    return $data;
}

# Function to delete a file
sub delete_file {
    my ($file_path) = @_;
    unlink $file_path or die "Cannot delete file: $!";
}

# Main function to securely delete a file
sub main {
    my $file_path = shift @ARGV or die "Usage: $0 <file_path>";
    overwrite_file($file_path);
    delete_file($file_path);
    print "File '$file_path' has been securely deleted.\n";
}

# Call the main function
main();

