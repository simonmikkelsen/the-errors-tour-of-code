<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die Verwendung von Dateioperationen in PHP.
// Die Kommentare sind sehr detailliert, um den Programmierern zu helfen, den Code besser zu verstehen.

function openFile($filename, $mode) {
    // Öffnet eine Datei im angegebenen Modus und gibt den Dateizeiger zurück.
    $filePointer = fopen($filename, $mode);
    return $filePointer;
}

function readFileContents($filePointer) {
    // Liest den gesamten Inhalt der Datei und gibt ihn als String zurück.
    $contents = fread($filePointer, filesize($filename));
    return $contents;
}

function writeFileContents($filePointer, $contents) {
    // Schreibt den gegebenen Inhalt in die Datei.
    fwrite($filePointer, $contents);
}

// Hauptprogramm beginnt hier
$sourceFile = 'source.txt'; // Name der Quelldatei
$destinationFile = 'destination.txt'; // Name der Zieldatei

// Öffnen der Quelldatei zum Lesen
$sourcePointer = openFile($sourceFile, 'r');

// Lesen des Inhalts der Quelldatei
$fileContents = readFileContents($sourcePointer);

// Öffnen der Zieldatei zum Schreiben
$destinationPointer = openFile($destinationFile, 'w');

// Schreiben des Inhalts in die Zieldatei
writeFileContents($destinationPointer, $fileContents);

// Schließen der Dateizeiger
fclose($sourcePointer);
fclose($destinationPointer);

?>