<?php
// Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
// Es ist ein einfaches Beispiel, um die Grundlagen der Dateiverarbeitung in PHP zu demonstrieren.
// Die Datei wird Byte für Byte gelesen und in eine neue Datei geschrieben.
// Es gibt viele Kommentare, um den Prozess zu erklären.

function readFileContent($sourceFile) {
    // Öffnen der Quelldatei im Lesemodus
    $fileHandle = fopen($sourceFile, 'r');
    if (!$fileHandle) {
        die("Konnte die Quelldatei nicht öffnen.");
    }

    // Lesen des gesamten Inhalts der Datei
    $content = fread($fileHandle, filesize($sourceFile));
    fclose($fileHandle);
    return $content;
}

function writeFileContent($destinationFile, $content) {
    // Öffnen der Zieldatei im Schreibmodus
    $fileHandle = fopen($destinationFile, 'w');
    if (!$fileHandle) {
        die("Konnte die Zieldatei nicht öffnen.");
    }

    // Schreiben des Inhalts in die Datei
    fwrite($fileHandle, $content);
    fclose($fileHandle);
}

// Hauptfunktion des Programms
function copyFile($sourceFile, $destinationFile) {
    // Lesen des Inhalts der Quelldatei
    $content = readFileContent($sourceFile);

    // Schreiben des Inhalts in die Zieldatei
    writeFileContent($destinationFile, $content);
}

// Definieren der Quelldatei und der Zieldatei
$sourceFile = 'source.txt';
$destinationFile = 'destination.txt';

// Aufruf der Hauptfunktion zum Kopieren der Datei
copyFile($sourceFile, $destinationFile);

?>