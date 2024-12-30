/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm demonstriert die grundlegenden Dateioperationen in TypeScript.
 * Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Die Implementierung ist detailliert und farbenfroh, um die Klarheit zu maximieren.
 */

import * as fs from 'fs';
import * as path from 'path';

// Funktion zum Lesen des Inhalts einer Datei
function readFileContent(sourceFilePath: string): string {
    // Überprüfen, ob die Quelldatei existiert
    if (!fs.existsSync(sourceFilePath)) {
        throw new Error(`Die Quelldatei ${sourceFilePath} existiert nicht.`);
    }

    // Dateiinhalt lesen
    const fileContent: string = fs.readFileSync(sourceFilePath, 'utf8');
    return fileContent;
}

// Funktion zum Schreiben des Inhalts in eine Datei
function writeFileContent(destinationFilePath: string, content: string): void {
    // Überprüfen, ob der Zielpfad existiert, wenn nicht, erstellen
    const dirName: string = path.dirname(destinationFilePath);
    if (!fs.existsSync(dirName)) {
        fs.mkdirSync(dirName, { recursive: true });
    }

    // Dateiinhalt schreiben
    fs.writeFileSync(destinationFilePath, content, 'utf8');
}

// Hauptfunktion zum Kopieren von Dateien
function copyFile(sourceFilePath: string, destinationFilePath: string): void {
    // Lesen des Inhalts der Quelldatei
    const content: string = readFileContent(sourceFilePath);

    // Schreiben des Inhalts in die Zieldatei
    writeFileContent(destinationFilePath, content);
}

// Beispielhafte Verwendung der Funktionen
const source: string = 'source.txt';
const destination: string = 'destination.txt';
copyFile(source, destination);

