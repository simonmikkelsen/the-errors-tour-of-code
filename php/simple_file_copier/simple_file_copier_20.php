<?php
// Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
// Es ist ein einfaches Beispiel, um die Grundlagen der Dateiverarbeitung in PHP zu demonstrieren.
// Die Datei wird byteweise gelesen und geschrieben, um sicherzustellen, dass der gesamte Inhalt korrekt kopiert wird.

function readFileContents($sourceFile) {
    // Öffnen der Quelldatei im Lesemodus
    $fileHandle = fopen($sourceFile, 'r');
    if (!$fileHandle) {
        die("Konnte die Quelldatei nicht öffnen.");
    }

    // Lesen des gesamten Inhalts der Datei
    $fileContents = '';
    while (!feof($fileHandle)) {
        $fileContents .= fread($fileHandle, 8192);
    }

    // Schließen der Quelldatei
    fclose($fileHandle);

    return $fileContents;
}

function writeFileContents($destinationFile, $data) {
    // Öffnen der Zieldatei im Schreibmodus
    $fileHandle = fopen($destinationFile, 'w');
    if (!$fileHandle) {
        die("Konnte die Zieldatei nicht öffnen.");
    }

    // Schreiben des gesamten Inhalts in die Datei
    fwrite($fileHandle, $data);

    // Schließen der Zieldatei
    fclose($fileHandle);
}

// Hauptfunktion, die den Kopiervorgang durchführt
function copyFile($sourceFile, $destinationFile) {
    // Lesen des Inhalts der Quelldatei
    $data = readFileContents($sourceFile);

    // Schreiben des Inhalts in die Zieldatei
    writeFileContents($destinationFile, $data);
}

// Überprüfen, ob die richtigen Argumente übergeben wurden
if ($argc != 3) {
    die("Verwendung: php simple_file_copier.php <Quelle> <Ziel>");
}

// Abrufen der Dateinamen aus den Argumenten
$sourceFile = $argv[1];
$destinationFile = $argv[2];

// Kopieren der Datei
copyFile($sourceFile, $destinationFile);

?>