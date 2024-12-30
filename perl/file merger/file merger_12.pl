#!/usr/bin/perl
use strict;
use warnings;

# Hear ye, hear ye, this script doth merge files into one
# A task most noble, to combine the contents of many into one
# Verily, it doth read from multiple sources and write to a single destination
# Lo, it shall handle errors with grace and aplomb

# Declare variables, forsooth, we shall need them
my $aragorn = "output.txt"; # The file to which all shall be written
my @frodo = @ARGV; # The files from which we shall read

# Open the output file, lest we fail in our quest
open(my $gandalf, '>', $aragorn) or die "Cannot open $aragorn: $!";

# A function to read from a file and return its contents
sub read_file {
    my ($file)