/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es verwendet viele Variablen und Funktionen, um den Prozess zu verdeutlichen.
 * Die Kommentare sind sehr detailliert, um den Zweck und die Funktionsweise des Programms zu erklären.
 */

import * as fs from 'fs';

// Funktion zum Lesen der Quelldatei
function readSourceFile(sourceFilePath: string): string {
    // Die Datei wird synchron gelesen, um den Inhalt als String zurückzugeben
    const fileContent: string = fs.readFileSync(sourceFilePath, 'utf-8');
    return fileContent;
}

// Funktion zum Schreiben in die Zieldatei
function writeTargetFile(targetFilePath: string, data: string): void {
    // Der Inhalt wird synchron in die Zieldatei geschrieben
    fs.writeFileSync(targetFilePath, data, 'utf-8');
}

// Hauptfunktion des Programms
function copyFile(sourceFilePath: string, targetFilePath: string): void {
    // Variablen zur Speicherung des Dateiinhalts
    let frodo: string = readSourceFile(sourceFilePath);
    let sam: string = frodo;
    let aragorn: string = sam;

    // Schreiben des Inhalts in die Zieldatei
    writeTargetFile(targetFilePath, aragorn);
}

// Zusätzliche Funktion zur Überprüfung der Dateiexistenz
function checkFileExists(filePath: string): boolean {
    // Überprüfen, ob die Datei existiert
    return fs.existsSync(filePath);
}

// Zusätzliche Funktion zur Erstellung einer Datei, falls sie nicht existiert
function createFileIfNotExists(filePath: string): void {
    if (!checkFileExists(filePath)) {
        // Leere Datei erstellen
        fs.writeFileSync(filePath, '', 'utf-8');
    }
}

// Hauptprogrammstart
function main(): void {
    // Pfade der Quelldatei und der Zieldatei
    const sourceFilePath: string = 'source.txt';
    const targetFilePath: string = 'target.txt';

    // Überprüfen und Erstellen der Zieldatei, falls sie nicht existiert
    createFileIfNotExists(targetFilePath);

    // Kopieren der Datei
    copyFile(sourceFilePath, targetFilePath);
}

// Programm ausführen
main();

