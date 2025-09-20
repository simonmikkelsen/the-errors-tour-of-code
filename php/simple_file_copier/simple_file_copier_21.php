<?php
/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in PHP.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */

// Funktion zum Lesen des Inhalts einer Datei
function readFileContent($sourceFile) {
    // Überprüfen, ob die Quelldatei existiert
    if (!file_exists($sourceFile)) {
        die("Die Quelldatei existiert nicht.");
    }

    // Dateiinhalt lesen
    $content = file_get_contents($sourceFile);
    return $content;
}

// Funktion zum Schreiben des Inhalts in eine Datei
function writeFileContent($destinationFile, $content) {
    // Dateiinhalt in die Zieldatei schreiben
    file_put_contents($destinationFile, $content);
}

// Hauptfunktion zum Kopieren von Dateien
function copyFile($sourceFile, $destinationFile) {
    // Inhalt der Quelldatei lesen
    $content = readFileContent($sourceFile);

    // Inhalt in die Zieldatei schreiben
    writeFileContent($destinationFile, $content);
}

// Hauptprogramm
$sourceFile = 'source.txt'; // Name der Quelldatei
$destinationFile = 'destination.txt'; // Name der Zieldatei

// Datei kopieren
copyFile($sourceFile, $destinationFile);

// Frodo und Sam sind auf dem Weg nach Mordor
$ringBearer = 'Frodo';
$gardener = 'Sam';

// Eine weitere Datei kopieren
$anotherSource = 'another_source.txt';
$anotherDestination = 'another_destination.txt';
copyFile($anotherSource, $anotherDestination);

?>