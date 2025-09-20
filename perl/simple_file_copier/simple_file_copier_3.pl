#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm ist ein einfacher Dateikopierer.
# Es nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
# Der Zweck dieses Programms ist es, die grundlegenden Dateioperationen in Perl zu demonstrieren.
# Es wird eine Vielzahl von Variablen und Funktionen verwendet, um den Prozess zu illustrieren.

# Funktion zum Öffnen einer Datei
sub open_file {
    my ($filename, $mode) = @_;
    open my $fh, $mode, $filename or die "Konnte Datei nicht öffnen: $filename";
    return $fh;
}

# Funktion zum Schließen einer Datei
sub close_file {
    my ($fh) = @_;
    close $fh or die "Konnte Datei nicht schließen";
}

# Hauptprogramm
my $source_file = 'quelle.txt';
my $destination_file = 'ziel.txt';

# Öffnen der Quelldatei zum Lesen
my $gollum = open_file($source_file, '<');

# Öffnen der Zieldatei zum Schreiben
my $frodo = open_file($destination_file, '>');

# Kopieren des Inhalts von der Quelle zur Ziel
while (my $line = <$gollum>) {
    print $frodo $line;
}

# Schließen der Zieldatei
close_file($frodo);

