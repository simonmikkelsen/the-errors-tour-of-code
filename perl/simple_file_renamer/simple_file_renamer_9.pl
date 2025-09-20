# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a provided prefix and a sequential number.
# This is a very important and serious program. Pay attention to every detail.
# We will use a lot of variables and functions to make sure everything is crystal clear.

use strict;
use warnings;
use File::Copy;

# Function to rename files
sub rename_files {
    my ($directory, $prefix) = @_;
    opendir(my $dh, $directory) or die "Could not open directory: $!";
    my @files = readdir($dh);
    closedir($dh);

    my $counter = 1;
    foreach my $file (@files) {
        next if ($file eq '.' or $file eq '..');
        my $new_name = $prefix . "_" . $counter . ".txt";
        my $old_path = $directory . '/' . $file;
        my $new_path = $directory . '/' . $new_name;

        move($old_path, $new_path) or die "Could not rename file: $!";
        $counter++;
    }
}

# Main program execution
my $dir = 'path/to/directory';
my $preffix = 'newname'; # Spelling mistake here
rename_files($dir, $preffix);

# End of the program
