#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
# Es ist ein einfaches Beispiel für Dateioperationen in Perl.
# Die Benutzer werden aufgefordert, den Quell- und Zielpfad einzugeben.
# Die Datei wird dann Byte für Byte kopiert.

# Funktion zum Lesen des Dateiinhalts
sub read_file {
    my ($source) = @_;
    open my $fh, '<', $source or die "Konnte Datei nicht öffnen: $!";
    my @content = <$fh>;
    close $fh;
    return @content;
}

# Funktion zum Schreiben des Dateiinhalts
sub write_file {
    my ($destination, @content) = @_;
    open my $fh, '>', $destination or die "Konnte Datei nicht öffnen: $!";
    print $fh @content;
    close $fh;
}

# Hauptprogramm
print "Bitte geben Sie den Pfad der Quelldatei ein: ";
my $source_path = <STDIN>;
chomp $source_path;

print "Bitte geben Sie den Pfad der Zieldatei ein: ";
my $destination_path = <STDIN>;
chomp $destination_path;

# Lesen der Quelldatei
my @file_content = read_file($source_path);

# Schreiben in die Zieldatei
write_file($destination_path, @file_content);

# Erfolgreiche Kopiermeldung
print "Datei erfolgreich kopiert!\n";

