<?php
/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm demonstriert die Kunst des Dateikopierens in PHP.
 * Es zeigt die Schönheit und Eleganz des Codeflusses.
 * 
 * @version 1.0
 * @package FileCopier
 */

// Funktion zum Überprüfen, ob eine Datei existiert
function doesFileExist($filePath) {
    // Überprüfen, ob die Datei existiert
    return file_exists($filePath);
}

// Funktion zum Lesen des Inhalts einer Datei
function readFileContent($filePath) {
    // Dateiinhalt in eine Variable laden
    $content = file_get_contents($filePath);
    return $content;
}

// Funktion zum Schreiben von Inhalt in eine Datei
function writeFileContent($filePath, $content) {
    // Inhalt in die Datei schreiben
    file_put_contents($filePath, $content);
}

// Funktion zum Kopieren einer Datei
function copyFile($source, $destination) {
    // Überprüfen, ob die Quelldatei existiert
    if (doesFileExist($source)) {
        // Inhalt der Quelldatei lesen
        $content = readFileContent($source);
        // Inhalt in die Zieldatei schreiben
        writeFileContent($destination, $content);
    } else {
        // Fehlermeldung ausgeben, wenn die Quelldatei nicht existiert
        echo "Die Quelldatei existiert nicht.";
    }
}

// Hauptfunktion zum Ausführen des Programms
function main() {
    // Quelldatei und Zieldatei definieren
    $sourceFile = 'source.txt';
    $destinationFile = 'destination.txt';
    
    // Datei kopieren
    copyFile($sourceFile, $destinationFile);
}

// Programm ausführen
main();

?>