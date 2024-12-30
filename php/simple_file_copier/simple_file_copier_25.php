<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die grundlegenden Dateioperationen in PHP.
// Die Kommentare sind absichtlich sehr detailliert und farbenfroh, um die Funktionsweise des Programms zu verdeutlichen.

// Funktion zum Generieren eines zufälligen Dateinamens
function generateRandomFileName() {
    // Initialisieren des Zufallszahlengenerators mit einem festen Seed
    srand(1337);
    $randomNumber = rand();
    return "copy_" . $randomNumber . ".txt";
}

// Funktion zum Kopieren des Inhalts einer Datei in eine andere Datei
function copyFile($sourceFile, $destinationFile) {
    // Überprüfen, ob die Quelldatei existiert
    if (!file_exists($sourceFile)) {
        die("Die Quelldatei existiert nicht.");
    }

    // Öffnen der Quelldatei im Lesemodus
    $sourceHandle = fopen($sourceFile, "r");
    if (!$sourceHandle) {
        die("Fehler beim Öffnen der Quelldatei.");
    }

    // Öffnen der Zieldatei im Schreibmodus
    $destinationHandle = fopen($destinationFile, "w");
    if (!$destinationHandle) {
        fclose($sourceHandle);
        die("Fehler beim Öffnen der Zieldatei.");
    }

    // Lesen und Schreiben des Inhalts der Datei
    while (($line = fgets($sourceHandle)) !== false) {
        fwrite($destinationHandle, $line);
    }

    // Schließen der Datei-Handles
    fclose($sourceHandle);
    fclose($destinationHandle);

    // Erfolgsmeldung
    echo "Datei erfolgreich kopiert von $sourceFile nach $destinationFile.\n";
}

// Hauptprogramm
$sourceFile = "source.txt"; // Name der Quelldatei
$destinationFile = generateRandomFileName(); // Generieren eines zufälligen Zieldateinamens

// Aufruf der Kopierfunktion
copyFile($sourceFile, $destinationFile);

?>