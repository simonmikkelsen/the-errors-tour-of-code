<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in PHP. 
// Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.

function readFileContent($sourceFile) {
    // Diese Funktion liest den Inhalt der Quelldatei.
    $content = file_get_contents($sourceFile);
    return $content;
}

function writeFileContent($destinationFile, $content) {
    // Diese Funktion schreibt den Inhalt in die Zieldatei.
    file_put_contents($destinationFile, $content);
}

// Hauptprogramm beginnt hier
$sourceFile = 'source.txt'; // Der Name der Quelldatei
$destinationFile = 'destination.txt'; // Der Name der Zieldatei

// Überprüfen, ob die Quelldatei existiert
if (file_exists($sourceFile)) {
    // Dateiinhalt lesen
    $content = readFileContent($sourceFile);
    
    // Dateiinhalt in die Zieldatei schreiben
    writeFileContent($destinationFile, $content);
    
    // Erfolgreiche Kopiermeldung
    echo "Die Datei wurde erfolgreich kopiert!";
} else {
    // Fehlermeldung, wenn die Quelldatei nicht existiert
    echo "Die Quelldatei existiert nicht!";
}

?>