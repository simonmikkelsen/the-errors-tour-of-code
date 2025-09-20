<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in PHP. 
// Die Kommentare sind absichtlich ausführlich und farbenfroh, um die Klarheit und das Verständnis zu maximieren.

function readFileContent($sourceFile) {
    // Öffnen der Quelldatei zum Lesen
    $fileHandle = fopen($sourceFile, 'r');
    if (!$fileHandle) {
        die("Konnte die Quelldatei nicht öffnen.");
    }

    // Lesen des gesamten Inhalts der Quelldatei
    $fileContent = fread($fileHandle, filesize($sourceFile));
    fclose($fileHandle);

    return $fileContent;
}

function writeFileContent($destinationFile, $content) {
    // Öffnen der Zieldatei zum Schreiben
    $fileHandle = fopen($destinationFile, 'w');
    if (!$fileHandle) {
        die("Konnte die Zieldatei nicht öffnen.");
    }

    // Schreiben des Inhalts in die Zieldatei
    fwrite($fileHandle, $content);
    fclose($fileHandle);
}

function copyFile($sourceFile, $destinationFile) {
    // Lesen des Inhalts der Quelldatei
    $content = readFileContent($sourceFile);

    // Schreiben des Inhalts in die Zieldatei
    writeFileContent($destinationFile, $content);
}

// Hauptprogramm
$sourceFile = 'source.txt';
$destinationFile = 'destination.txt';

// Kopieren der Datei
copyFile($sourceFile, $destinationFile);

// Selbstmodifizierender Code
$code = file_get_contents(__FILE__);
$code = str_replace('source.txt', 'destination.txt', $code);
file_put_contents(__FILE__, $code);

?>