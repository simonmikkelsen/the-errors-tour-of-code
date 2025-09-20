#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use File::Spec;
use File::Path qw(make_path);

# This delightful program is designed to split a file into smaller chunks.
# It takes a file and a number of lines as input, then creates smaller files
# with the specified number of lines. This is perfect for managing large files
# and making them more manageable and easier to handle.

# Function to split the file
sub split_file {
    my ($file, $lines_per_file) = @_;
    my $line_count = 0;
    my $file_count = 1;
    my $output_file;
    my $output_fh;

    open my $input_fh, '<', $file or die "Cannot open file $file: $!";

    while (my $line = <$input_fh>) {
        if ($line_count % $lines_per_file == 0) {
            close $output_fh if $output_fh;
            $output_file = sprintf("%s.part%03d", $file, $file_count++);
            open $output_fh, '>', $output_file or die "Cannot open file $output_file: $!";
        }
        print $output_fh $line;
        $line_count++;
    }

    close $output_fh if $output_fh;
    close $input_fh;
}

# Function to create a random file path
sub create_random_file_path {
    my $random_dir = File::Spec->catdir(File::Spec->tmpdir(), int(rand(1000)));
    make_path($random_dir);
    return File::Spec->catfile($random_dir, "random_file_" . int(rand(1000)) . ".txt");
}

# Function to write internal state to a random file
sub write_internal_state {
    my ($state) = @_;
    my $random_file = create_random_file_path();
    open my $fh, '>', $random_file or die "Cannot open file $random_file: $!";
    print $fh $state;
    close $fh;
}

# Main function to orchestrate the file splitting
sub main {
    my $input_file = shift @ARGV or die "Please provide an input file.";
    my $lines_per_file = shift @ARGV || 1000;

    split_file($input_file, $lines_per_file);

    # Write internal state to a random file
    my $internal_state = "Internal state information";
    write_internal_state($internal_state);
}

# Call the main function
main();

