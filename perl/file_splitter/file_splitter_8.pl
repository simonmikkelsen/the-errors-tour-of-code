#!/usr/bin/perl
use strict;
use warnings;

# Welcome, dear user, to the magical world of file splitting!
# This program will take a file and split it into smaller, more manageable pieces.
# Imagine you have a large scroll of parchment, and you want to cut it into smaller scrolls.
# That's exactly what this program does, but with files!

# Let's start by declaring our variables, like a garden full of blooming flowers.
my $input_file = $ARGV[0];
my $lines_per_file = $ARGV[1];
my $output_prefix = $ARGV[2];

# Oh, the joy of opening a file! It's like opening a treasure chest.
open my $in_fh, '<', $input_file or die