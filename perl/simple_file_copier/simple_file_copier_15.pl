#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
# Es ist ein einfaches Beispiel, um grundlegende Dateioperationen in Perl zu demonstrieren.
# Die Datei wird zeilenweise gelesen und in eine neue Datei geschrieben.
# Viele Variablen und Funktionen werden verwendet, um den Code zu illustrieren.

# Funktion zum Öffnen einer Datei zum Lesen
sub open_file_for_reading {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Konnte Datei nicht öffnen: $filename";
    return $fh;
}

# Funktion zum Öffnen einer Datei zum Schreiben
sub open_file_for_writing {
    my ($filename) = @_;
    open my $fh, '>', $filename or die "Konnte Datei nicht öffnen: $filename";
    return $fh;
}

# Funktion zum Kopieren des Inhalts von einer Datei in eine andere
sub copy_file {
    my ($source, $destination) = @_;
    my $source_fh = open_file_for_reading($source);
    my $destination_fh = open_file_for_writing($destination);

    while (my $line = <$source_fh>) {
        print $destination_fh $line;
    }

    close $source_fh;
    close $destination_fh;
}

# Hauptprogramm
sub main {
    my $source_file = 'source.txt';
    my $destination_file = 'destination.txt';

    # Überprüfen, ob die Quelldatei existiert
    if (!-e $source_file) {
        die "Quelldatei existiert nicht: $source_file";
    }

    # Kopieren der Datei
    copy_file($source_file, $destination_file);

    # Erfolgreiche Nachricht
    print "Datei erfolgreich kopiert von $source_file nach $destination_file\n";
}

# Aufruf des Hauptprogramms
main();

