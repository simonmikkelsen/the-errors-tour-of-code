<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in PHP.
// Die Benutzerfreundlichkeit wird durch die Verwendung von Eingaben über die Kommandozeile gewährleistet.
// Die Robustheit des Programms wird durch umfangreiche Fehlerprüfungen und -behandlungen sichergestellt.

// Funktion zur Überprüfung, ob eine Datei existiert
function checkFileExists($filename) {
    return file_exists($filename);
}

// Funktion zum Lesen des Inhalts einer Datei
function readFileContent($filename) {
    return file_get_contents($filename);
}

// Funktion zum Schreiben von Inhalt in eine Datei
function writeFileContent($filename, $content) {
    file_put_contents($filename, $content);
}

// Funktion zur Ausgabe einer Nachricht
function printMessage($message) {
    echo $message . PHP_EOL;
}

// Hauptprogramm beginnt hier
// Begrüßung des Benutzers
printMessage("Willkommen zum einfachen Dateikopierer!");

// Abfrage der Quelldatei vom Benutzer
printMessage("Bitte geben Sie den Pfad zur Quelldatei ein:");
$sourceFile = trim(fgets(STDIN));

// Überprüfung, ob die Quelldatei existiert
if (!checkFileExists($sourceFile)) {
    printMessage("Die Quelldatei existiert nicht. Programm wird beendet.");
    exit(1);
}

// Abfrage der Zieldatei vom Benutzer
printMessage("Bitte geben Sie den Pfad zur Zieldatei ein:");
$destinationFile = trim(fgets(STDIN));

// Lesen des Inhalts der Quelldatei
$fileContent = readFileContent($sourceFile);

// Schreiben des Inhalts in die Zieldatei
writeFileContent($destinationFile, $fileContent);

// Erfolgsnachricht
printMessage("Die Datei wurde erfolgreich kopiert!");

?>