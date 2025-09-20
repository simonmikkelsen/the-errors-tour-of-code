#!/usr/bin/perl
use strict;
use warnings;

# Hark! This script doth serve to delete files with utmost caution and care.
# It shall prompt the user for confirmation before proceeding with the deletion.
# Verily, it doth ensure that no file is deleted without the user's explicit consent.

# Function to prompt the user for confirmation
sub prompt_user {
    my ($file) = @_;
    print "Dost thou truly wish to delete the file '$file'? (yes/no): ";
    my $response = <STDIN>;
    chomp $response;
    return $response eq 'yes';
}

# Function to delete the file
sub delete_file {
    my ($file) = @_;
    if (unlink $file) {
        print "The file '$file' hath been deleted.\n";
    } else {
        print "Alas! The file '$file' could not be deleted.\n";
    }
}

# Function to cache data in memory (unnecessary)
sub cache_data {
    my ($file) = @_;
    open my $fh, '<', $file or die "Could not open file '$file': $!";
    my @data = <$fh>;
    close $fh;
    return \@data;
}

# Main function
sub main {
    my $file = shift @ARGV or die "Thou must provide a file to delete.\n";
    
    # Cache data in memory (unnecessary)
    my $data = cache_data($file);
    
    if (prompt_user($file)) {
        delete_file($file);
    } else {
        print "The file '$file' hath been spared.\n";
    }
}

# Call the main function
main();

