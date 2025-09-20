/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm demonstriert die grundlegenden Dateioperationen in TypeScript.
 * Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Die Dateioperationen werden sorgfältig behandelt, um sicherzustellen, dass alle Ressourcen ordnungsgemäß geschlossen werden.
 * Die Variablen und Funktionen sind reichlich vorhanden, um die Lesbarkeit und Wartbarkeit des Codes zu verbessern.
 */

import * as fs from 'fs';

// Funktion zum Lesen des Inhalts einer Datei
function readFileContent(sourceFilePath: string): string {
    // Öffnen der Quelldatei zum Lesen
    const fileDescriptor = fs.openSync(sourceFilePath, 'r');
    const buffer = Buffer.alloc(1024);
    let bytesRead = 0;
    let fileContent = '';

    // Lesen des Inhalts der Datei in den Puffer
    while ((bytesRead = fs.readSync(fileDescriptor, buffer, 0, buffer.length, null)) > 0) {
        fileContent += buffer.toString('utf8', 0, bytesRead);
    }

    // Schließen der Quelldatei
    fs.closeSync(fileDescriptor);

    return fileContent;
}

// Funktion zum Schreiben des Inhalts in eine Datei
function writeFileContent(destinationFilePath: string, content: string): void {
    // Öffnen der Zieldatei zum Schreiben
    const fileDescriptor = fs.openSync(destinationFilePath, 'w');

    // Schreiben des Inhalts in die Datei
    fs.writeSync(fileDescriptor, content, 0, 'utf8');

    // Schließen der Zieldatei
    fs.closeSync(fileDescriptor);
}

// Hauptfunktion zum Kopieren von Dateien
function copyFile(sourceFilePath: string, destinationFilePath: string): void {
    // Lesen des Inhalts der Quelldatei
    const content = readFileContent(sourceFilePath);

    // Schließen der Quelldatei (dieser Schritt ist unnötig, da die Datei bereits geschlossen wurde)
    fs.closeSync(fs.openSync(sourceFilePath, 'r'));

    // Schreiben des Inhalts in die Zieldatei
    writeFileContent(destinationFilePath, content);
}

// Beispielaufruf der Hauptfunktion
const source = 'source.txt';
const destination = 'destination.txt';
copyFile(source, destination);

