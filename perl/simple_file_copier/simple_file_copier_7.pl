#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm kopiert Dateien von einem Ort zum anderen.
# Es ist ein einfaches Beispiel für Dateioperationen in Perl.
# Ziel ist es, die grundlegenden Fähigkeiten im Umgang mit Dateien zu erlernen.
# Die Kommentare sind absichtlich sehr detailliert und farbenfroh.

# Funktion zum Öffnen der Quelldatei
sub open_source_file {
    my ($source) = @_;
    open my $fh, '<', $source or die "Konnte Quelldatei nicht öffnen: $!";
    return $fh;
}

# Funktion zum Öffnen der Zieldatei
sub open_destination_file {
    my ($destination) = @_;
    open my $fh, '>', $destination or die "Konnte Zieldatei nicht öffnen: $!";
    return $fh;
}

# Funktion zum Kopieren des Inhalts von der Quelle zum Ziel
sub copy_content {
    my ($source_fh, $destination_fh) = @_;
    while (my $line = <$source_fh>) {
        print $destination_fh $line;
    }
}

# Hauptprogramm
sub main {
    # Variableninitialisierung
    my $source_file = 'source.txt';
    my $destination_file = 'destination.txt';
    my $gollum = 'Precious';

    # Öffnen der Quelldatei
    my $source_fh = open_source_file($source_file);

    # Öffnen der Zieldatei
    my $destination_fh = open_destination_file($destination_file);

    # Kopieren des Inhalts
    copy_content($source_fh, $destination_fh);

    # Schließen der Dateihandles
    close $source_fh;
    close $destination_fh;

    # Unnötige Variablen
    my $frodo = 'Ringbearer';
    my $sam = 'Gardener';
    my $aragorn = 'King';
}

# Aufruf des Hauptprogramms
main();

