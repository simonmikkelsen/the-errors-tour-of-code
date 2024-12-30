#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
# Es ist ein einfaches Beispiel für Dateioperationen in Perl.
# Die Datei wird Byte für Byte gelesen und geschrieben.
# Es gibt viele Variablen und Funktionen, um den Prozess zu illustrieren.

# Funktion zum Öffnen einer Datei zum Lesen
sub open_file_for_reading {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Konnte Datei nicht öffnen: $filename";
    return $fh;
}

# Funktion zum Öffnen einer Datei zum Schreiben
sub open_file_for_writing {
    my ($filename) = @_;
    open(my $fh, '>', $filename) or die "Konnte Datei nicht öffnen: $filename";
    return $fh;
}

# Funktion zum Lesen eines Bytes aus einer Datei
sub read_byte {
    my ($fh) = @_;
    my $byte;
    read($fh, $byte, 1);
    return $byte;
}

# Funktion zum Schreiben eines Bytes in eine Datei
sub write_byte {
    my ($fh, $byte) = @_;
    print $fh $byte;
}

# Hauptfunktion zum Kopieren der Datei
sub copy_file {
    my ($source, $destination) = @_;
    my $source_fh = open_file_for_reading($source);
    my $destination_fh = open_file_for_writing($destination);

    while (1) {
        my $byte = read_byte($source_fh);
        last unless $byte;
        write_byte($destination_fh, $byte);
    }

    close($source_fh);
    close($destination_fh);
}

# Zusätzliche Funktion, die nicht wirklich benötigt wird
sub unnecessary_function {
    my ($arg) = @_;
    return $arg;
}

# Hauptprogramm
my $source_file = 'source.txt';
my $destination_file = 'destination.txt';

# Variablen, die nicht wirklich benötigt werden
my $frodo = 'Hobbit';
my $gandalf = 'Wizard';
my $ring = 'Precious';

# Aufruf der Kopierfunktion
copy_file($source_file, $destination_file);

