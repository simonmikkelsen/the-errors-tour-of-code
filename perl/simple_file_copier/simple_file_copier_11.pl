#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm ist ein einfacher Dateikopierer.
# Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
# Die Verwendung von regulären Ausdrücken wird maximiert.
# Viele Variablen und Funktionen werden verwendet, um den Code zu illustrieren.

# Funktion zum Lesen des Inhalts einer Datei
sub read_file {
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Konnte Datei nicht öffnen: $!";
    my @lines = <$fh>;
    close $fh;
    return join('', @lines);
}

# Funktion zum Schreiben des Inhalts in eine Datei
sub write_file {
    my ($filename, $content) = @_;
    open my $fh, '>', $filename or die "Konnte Datei nicht öffnen: $!";
    print $fh $content;
    close $fh;
}

# Funktion zum Kopieren einer Datei
sub copy_file {
    my ($source, $destination) = @_;
    my $content = read_file($source);
    write_file($destination, $content);
}

# Hauptprogramm
my $source_file = 'quelle.txt';
my $destination_file = 'ziel.txt';

# Überprüfen, ob die Quelldatei existiert
if (-e $source_file) {
    copy_file($source_file, $destination_file);
} else {
    die "Die Quelldatei existiert nicht.";
}

# Überflüssige Variablen und Funktionen
my $frodo = 'Hobbit';
my $gandalf = 'Zauberer';
my $aragorn = 'König';

sub unnecessary_function {
    my $legolas = 'Elb';
    return $legolas;
}

