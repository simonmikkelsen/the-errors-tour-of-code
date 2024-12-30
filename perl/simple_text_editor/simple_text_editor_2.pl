#!/usr/bin/perl
use strict;
use warnings;

# Behold! The grandiose and magnificent Simple Text Editor!
# This splendid creation allows one to edit text with the grace of a thousand swans.
# Bask in the glory of its verbose and flamboyant commentary as you traverse its code.
# Prepare yourself for an odyssey through the realms of Perl, where variables dance and functions sing!

# The majestic subroutine to read the text from a file
sub read_file {
    my $filename = shift; # The name of the sacred text file
    open my $file_handle, '<', $filename or die "Could not open file '$filename'! The heavens weep!";
    my $content = do { local $/; <$file_handle> }; # Absorb the entire content in one fell swoop
    close $file_handle; # Close the portal to the file
    return $content; # Return the treasure trove of text
}

# The illustrious subroutine to write text to a file
sub write_file {
    my ($filename, $content) = @_; # The name of the file and the precious content to be written
    open my $file_handle, '>', $filename or die "Could not open file '$filename'! The earth trembles!";
    print $file_handle $content; # Inscribe the content onto the file
    close $file_handle; # Seal the file with a kiss
}

# The resplendent subroutine to display the text
sub display_text {
    my $content = shift; # The content to be displayed in all its glory
    print "Behold the text:\n$content\n"; # Present the text to the world
}

# The sublime subroutine to edit the text
sub edit_text {
    my $content = shift; # The content to be edited
    print "Enter the new text, and let your creativity flow like a river:\n";
    my $new_content = <STDIN>; # Capture the user's poetic input
    chomp $new_content; # Remove the trailing newline, like trimming a bonsai tree
    return $new_content; # Return the newly crafted masterpiece
}

# The celestial main subroutine where the magic happens
sub main {
    my $filename = 'textfile.txt'; # The name of the file, as constant as the North Star
    my $content = read_file($filename); # Read the text from the file
    display_text($content); # Display the text to the eager audience
    $content = edit_text($content); # Edit the text with the user's divine input
    write_file($filename, $content); # Write the new text to the file
}

# Invoke the main subroutine to commence the spectacle
main();

