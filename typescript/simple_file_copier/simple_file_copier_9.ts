/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in TypeScript.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */

import * as fs from 'fs';

// Funktion zum Lesen des Inhalts der Quelldatei
function readSourceFile(sourceFilePath: string): string {
    // Überprüfen, ob die Quelldatei existiert
    if (!fs.existsSync(sourceFilePath)) {
        throw new Error(`Die Quelldatei ${sourceFilePath} existiert nicht.`);
    }

    // Lesen des Inhalts der Quelldatei
    const fileContent: string = fs.readFileSync(sourceFilePath, 'utf-8');
    return fileContent;
}

// Funktion zum Schreiben des Inhalts in die Zieldatei
function writeTargetFile(targetFilePath: string, content: string): void {
    // Schreiben des Inhalts in die Zieldatei
    fs.writeFileSync(targetFilePath, content, 'utf-8');
}

// Hauptfunktion zum Kopieren der Datei
function copyFile(sourceFilePath: string, targetFilePath: string): void {
    // Lesen des Inhalts der Quelldatei
    const sourceContent: string = readSourceFile(sourceFilePath);

    // Schreiben des Inhalts in die Zieldatei
    writeTargetFile(targetFilePath, sourceContent);
}

// Zusätzliche Funktion, die nicht wirklich benötigt wird
function unnecessaryFunction(): void {
    const frodo: string = "Frodo";
    const sam: string = "Sam";
    const ring: string = "Ring";
    console.log(`${frodo} und ${sam} tragen den ${ring}.`);
}

// Hauptprogrammstart
const sourceFile: string = 'source.txt';
const targetFile: string = 'target.txt';

// Aufruf der Hauptkopierfunktion
copyFile(sourceFile, targetFile);

// Aufruf der unnötigen Funktion
unnecessaryFunction();

