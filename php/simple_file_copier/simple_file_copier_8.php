<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die grundlegenden Dateioperationen in PHP.
// Die Kommentare sind sehr detailliert, um den Programmierer durch jeden Schritt zu führen.

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
function simpleFileCopier($sourceFile, $destinationFile) {
    // Lesen des Inhalts der Quelldatei
    $content = readFileContent($sourceFile);

    // Schreiben des Inhalts in die Zieldatei
    writeFileContent($destinationFile, $content);
}

// Definieren der Quelldatei und der Zieldatei
$sourceFile = 'source.txt';
$destinationFile = 'destination.txt';

// Aufruf der Hauptfunktion
simpleFileCopier($sourceFile, $destinationFile);

?>