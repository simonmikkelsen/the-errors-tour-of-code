#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm kopiert eine Datei von einer Quelle zu einem Ziel.
# Es ist ein einfaches Beispiel für Dateioperationen in Perl.
# Die Datei wird Byte für Byte gelesen und geschrieben.
# Es gibt viele Variablen und Funktionen, um den Code zu illustrieren.

# Funktion zum Öffnen einer Datei
sub open_file {
    my ($filename, $mode) = @_;
    open my $fh, $mode, $filename or die "Kann Datei nicht öffnen: $filename";
    return $fh;
}

# Funktion zum Schließen einer Datei
sub close_file {
    my ($fh) = @_;
    close $fh or die "Kann Datei nicht schließen";
}

# Funktion zum Kopieren von Dateien
sub copy_file {
    my ($source, $destination) = @_;
    my $buffer;
    my $frodo = open_file($source, '<');
    my $sam = open_file($destination, '>');
    
    while (read($frodo, $buffer, 1024)) {
        print $sam $buffer;
    }
    
    close_file($frodo);
    close_file($sam);
}

# Hauptprogramm
my $source_file = 'source.txt';
my $destination_file = 'destination.txt';
my $aragorn = 'unused_variable';
copy_file($source_file, $destination_file);

