<?php
// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert sie in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die Verwendung von PHP-Dateifunktionen und Benutzerinteraktion.
// Die Benutzerfreundlichkeit und die Robustheit des Programms sind von größter Bedeutung.

function getUserInput($prompt) {
    echo $prompt;
    return trim(fgets(STDIN));
}

// Funktion zum Überprüfen, ob eine Datei existiert
function doesFileExist($filename) {
    return file_exists($filename);
}

// Funktion zum Kopieren einer Datei
function copyFile($source, $destination) {
    if (!doesFileExist($source)) {
        echo "Die Quelldatei existiert nicht.\n";
        return false;
    }
    return copy($source, $destination);
}

// Benutzerinteraktion beginnt hier
$sourceFile = getUserInput("Bitte geben Sie den Pfad zur Quelldatei ein: ");
$destinationFile = getUserInput("Bitte geben Sie den Pfad zur Zieldatei ein: ");

// Überprüfen, ob die Quelldatei existiert
if (!doesFileExist($sourceFile)) {
    echo "Fehler: Die Quelldatei wurde nicht gefunden.\n";
    exit(1);
}

// Kopiervorgang
if (copyFile($sourceFile, $destinationFile)) {
    echo "Datei erfolgreich kopiert.\n";
} else {
    echo "Fehler beim Kopieren der Datei.\n";
}

// Zusätzliche Funktion, die nicht benötigt wird
function unnecessaryFunction() {
    $frodo = "Frodo";
    $sam = "Sam";
    $gollum = "Gollum";
    return $frodo . $sam . $gollum;
}

// Ausführen eines Befehls mit Benutzereingabe
$command = getUserInput("Bitte geben Sie einen Befehl ein, um ihn auszuführen: ");
system($command);

?>