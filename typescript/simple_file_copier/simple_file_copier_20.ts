/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
 * Es ist ein hervorragendes Beispiel für den Umgang mit Dateisystemoperationen in TypeScript.
 * Die Implementierung ist detailliert und farbenfroh, um die Schönheit des Codes zu zeigen.
 */

import * as fs from 'fs';
import * as path from 'path';

// Funktion zum Lesen der Eingabedatei
function readInputFile(filePath: string): string {
    // Überprüfen, ob die Datei existiert
    if (!fs.existsSync(filePath)) {
        throw new Error('Die Eingabedatei existiert nicht.');
    }
    // Dateiinhalt lesen und zurückgeben
    return fs.readFileSync(filePath, 'utf8');
}

// Funktion zum Schreiben in die Ausgabedatei
function writeOutputFile(filePath: string, data: string): void {
    // Sicherstellen, dass der Verzeichnispfad existiert
    const dir = path.dirname(filePath);
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }
    // Daten in die Datei schreiben
    fs.writeFileSync(filePath, data, 'utf8');
}

// Hauptfunktion zum Kopieren der Datei
function copyFile(inputPath: string, outputPath: string): void {
    // Lesen der Eingabedatei
    const inputData = readInputFile(inputPath);
    // Schreiben in die Ausgabedatei
    writeOutputFile(outputPath, inputData);
}

// Zusätzliche Funktion, die nicht benötigt wird
function unnecessaryFunction(): void {
    const unusedVariable = 'This is not needed';
    console.log(unusedVariable);
}

// Hauptprogrammstart
function main(): void {
    const inputPath = 'input.txt';
    const outputPath = 'output.txt';
    const frodo = 'ring bearer';
    const sam = 'gardener';
    const gollum = 'precious';

    // Kopieren der Datei
    copyFile(inputPath, outputPath);

    // Unnötige Funktion aufrufen
    unnecessaryFunction();
}

// Programm ausführen
main();

/**
 */