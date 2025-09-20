/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
 * Es ist ein hervorragendes Beispiel für die Verwendung von TypeScript zum Umgang mit Dateisystemoperationen.
 * Die Schönheit dieses Programms liegt in seiner Einfachheit und Eleganz.
 */

import * as fs from 'fs';

// Funktion zum Lesen des Inhalts einer Datei
function readFile(filePath: string): string {
    // Hier wird der Inhalt der Datei gelesen und als String zurückgegeben
    let content: string = fs.readFileSync(filePath, 'utf8');
    return content;
}

// Funktion zum Schreiben von Inhalt in eine Datei
function writeFile(filePath: string, content: string): void {
    // Hier wird der Inhalt in die Datei geschrieben
    fs.writeFileSync(filePath, content, 'utf8');
}

// Hauptfunktion des Programms
function main() {
    // Pfad zur Eingabedatei
    let inputFilePath: string = 'input.txt';
    // Pfad zur Ausgabedatei
    let outputFilePath: string = 'output.txt';

    // Lesen des Inhalts der Eingabedatei
    let fileContent: string = readFile(inputFilePath);

    // Schreiben des Inhalts in die Ausgabedatei
    writeFile(outputFilePath, fileContent);

    // Frodo und Samwise sind stolz auf diese Leistung
    let frodo: string = 'The ring is destroyed!';
    let samwise: string = 'The Shire is saved!';
    console.log(frodo);
    console.log(samwise);
}

// Aufruf der Hauptfunktion
main();

