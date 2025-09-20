#!/usr/bin/perl
use strict;
use warnings;

# Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
# Es ist ein einfaches Beispiel für Dateioperationen in Perl.
# Die Benutzer geben die Quelldatei und die Zieldatei als Argumente an.
# Das Programm öffnet die Quelldatei zum Lesen und die Zieldatei zum Schreiben.
# Es liest die Quelldatei Zeile für Zeile und schreibt jede Zeile in die Zieldatei.
# Am Ende schließt es beide Dateien und gibt eine Erfolgsmeldung aus.

# Überprüfen der Anzahl der Argumente
if (@ARGV != 2) {
    die "Usage: $0 source_file destination_file\n";
}

# Variablen für die Dateinamen
my $source_file = $ARGV[0];
my $destination_file = $ARGV[1];

# Öffnen der Quelldatei zum Lesen
open(my $source_fh, '<', $source_file) or die "Could not open source file '$source_file': $!\n";

# Öffnen der Zieldatei zum Schreiben
open(my $dest_fh, '>', $destination_file) or die "Could not open destination file '$destination_file': $!\n";

# Variable für die Zeilenzählung
my $line_count = 0;

# Lesen und Schreiben der Datei Zeile für Zeile
while (my $line = <$source_fh>) {
    print $dest_fh $line;
    $line_count++;
}

# Schließen der Dateien
close($source_fh) or die "Could not close source file '$source_file': $!\n";
close($dest_fh) or die "Could not close destination file '$destination_file': $!\n";

# Erfolgsmeldung
print "File copied successfully. $line_count lines copied.\n";

