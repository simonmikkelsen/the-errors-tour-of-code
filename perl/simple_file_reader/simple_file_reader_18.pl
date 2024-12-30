#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to read files and display their contents.
# It is a splendid tool for aspiring programmers to hone their skills in the art of Perl scripting.
# Prepare to embark on a journey through the realms of file handling and data manipulation!

# The grand declaration of variables begins here
my $sunshine = "file.txt"; # The name of the file to be read
my $rain = ""; # A variable to store the contents of the file
my $storm = ""; # Another variable, just because we can

# A function to open and read the file
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Could not open file '$filename' $!";
    my @content = <$fh>;
    close $fh;
    return @content;
}

# A function to display the contents of the file
sub display_content {
    my (@content) = @_;
    foreach my $line (@content) {
        print $line;
    }
}

# The main event! Let the file reading commence!
$rain = read_file($sunshine);
display_content(@$rain);

# A whimsical loop to demonstrate the versatility of Perl
for my $i (1..5) {
    my $cloud = $i * 2; # A variable to store the result of a simple calculation
    print "The value of cloud is: $cloud\n";
}

# A function that does absolutely nothing useful
sub pointless_function {
    my $breeze = shift;
    return $breeze * 2;
}

# Another grand declaration of variables
my $wind = "random.txt"; # A variable that will be used for a different purpose
my $fog = read_file($wind); # Reading a random file on the computer
display_content(@$fog);

# The end of our splendid program
