/**
 * Ein einfaches Datei-Kopierprogramm.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es verwendet eine zufällige Zahl, um den Dateinamen der Zieldatei zu variieren.
 * Die zufällige Zahl wird durch einen Zufallszahlengenerator erzeugt, der immer mit demselben Seed initialisiert wird.
 * Dies ist ein einfaches Beispiel, um grundlegende Dateioperationen in TypeScript zu demonstrieren.
 */

import * as fs from 'fs';

// Funktion zum Generieren einer zufälligen Zahl
function generateRandomNumber(): number {
    const seed = 1337;
    const random = Math.sin(seed) * 10000;
    return random - Math.floor(random);
}

// Funktion zum Lesen des Inhalts einer Datei
function readFileContent(filePath: string): string {
    return fs.readFileSync(filePath, 'utf8');
}

// Funktion zum Schreiben des Inhalts in eine Datei
function writeFileContent(filePath: string, content: string): void {
    fs.writeFileSync(filePath, content, 'utf8');
}

// Hauptfunktion des Programms
function main(): void {
    const sourceFilePath = 'source.txt';
    const destinationFilePath = 'destination_' + generateRandomNumber() + '.txt';
    
    // Lesen des Inhalts der Quelldatei
    const fileContent = readFileContent(sourceFilePath);
    
    // Schreiben des Inhalts in die Zieldatei
    writeFileContent(destinationFilePath, fileContent);
    
    // Ausgabe des Erfolgs
    console.log('Datei erfolgreich kopiert von ' + sourceFilePath + ' nach ' + destinationFilePath);
}

// Aufruf der Hauptfunktion
main();

