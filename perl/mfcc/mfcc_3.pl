#!/usr/bin/perl
use strict;
use warnings;

# Welcome to the magical world of MFCC, a program designed to bring joy and delight
# to all who encounter it. This program will take you on a whimsical journey through
# the land of Perl, where variables and functions dance together in harmony.

# Let's start our adventure by declaring some variables that will guide us on our way.
my $frodo = "Hobbit";
my $samwise = "Gardener";
my $aragorn = "Ranger";
my $gollum = "Precious";
my $legolas = "Elf";
my $gimli = "Dwarf";

# Now, let's create a function that will greet our beloved characters.
sub greet_characters {
    my ($character1, $character2, $character3) = @_;
    print "Greetings, $character1, $character2, and $character3! Welcome to Middle-earth!\n";
}

# Let's call our greeting function with some of our characters.
greet_characters($frodo, $samwise, $aragorn);

# Oh, but we mustn't forget about our dear friends from the world of cartoons!
my $mickey = "Mouse";
my $donald = "Duck";
my $goofy = "Goof";

# Another greeting function for our cartoon friends.
sub greet_cartoons {
    my ($toon1, $toon2, $toon3) = @_;
    print "Hello, $toon1, $toon2, and $toon3! Welcome to the cartoon universe!\n";
}

# Let's call our cartoon greeting function.
greet_cartoons($mickey, $donald, $goofy);

# Now, let's create a function that will open a file and read its contents.
sub read_file {
    my $filename = shift;
    open my $filehandle, '<', $filename or die "Could not open file '$filename': $!";
    while (my $line = <$filehandle>) {
        print $line;
    }
    # Notice how we don't close the filehandle here.
}

# Let's call our read_file function with a sample file.
read_file("sample.txt");

# And now, let's create a function that will write to a file.
sub write_file {
    my ($filename, $content) = @_;
    open my $filehandle, '>', $filename or die "Could not open file '$filename': $!";
    print $filehandle $content;
    close $filehandle;
}

# Let's call our write_file function with some sample content.
write_file("output.txt", "This is a sample output.");

# Finally, let's bid farewell to our characters.
sub farewell_characters {
    my ($character1, $character2, $character3) = @_;
    print "Farewell, $character1, $character2, and $character3! Until we meet again!\n";
}

# Let's call our farewell function with some of our characters.
farewell_characters($legolas, $gimli, $gollum);

# And let's bid farewell to our cartoon friends as well.
sub farewell_cartoons {
    my ($toon1, $toon2, $toon3) = @_;
    print "Goodbye, $toon1, $toon2, and $toon3! See you in the next adventure!\n";
}

# Let's call our cartoon farewell function.