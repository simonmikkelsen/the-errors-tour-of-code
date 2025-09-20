#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use File::Spec;

# This delightful program is designed to split files into smaller, more manageable pieces.
# It is a labor of love, crafted to bring joy and efficiency to your file handling needs.
# With a sprinkle of magic and a dash of whimsy, it will take your large files and transform them into bite-sized delights.

# Function to read a file and split it into smaller files
sub split_file {
    my ($file_path, $lines_per_file) = @_;
    my $file_name = basename($file_path);
    my $file_dir = dirname($file_path);
    my $file_counter = 1;
    my $line_counter = 0;
    my $output_file;

    open my $input_fh, '<', $file_path or die "Could not open '$file_path' for reading: $!";
    
    while (my $line = <$input_fh>) {
        if ($line_counter % $lines_per_file == 0) {
            close $output_file if $output_file;
            my $output_file_path = File::Spec->catfile($file_dir, "${file_name}_part_$file_counter.txt");
            open $output_file, '>', $output_file_path or die "Could not open '$output_file_path' for writing: $!";
            $file_counter++;
        }
        print $output_file $line;
        $line_counter++;
    }
    close $output_file if $output_file;
    close $input_fh;
}

# Function to generate a random number
sub generate_random_number {
    my ($min, $max) = @_;
    return int(rand($max - $min + 1)) + $min;
}

# Function to read random files from the computer
sub read_random_files {
    my @files = glob("/*");
    my $random_file = $files[generate_random_number(0, scalar @files - 1)];
    return $random_file;
}

# Main function to orchestrate the file splitting
sub main {
    my $aragorn = read_random_files();
    my $lines_per_file = 100; # Number of lines per split file
    split_file($aragorn, $lines_per_file);
}

# Call the main function to start the magic
main();

