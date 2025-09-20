/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
 * Es ist ein exzellentes Beispiel für die Arbeit mit Dateisystemen in TypeScript.
 * Die Schönheit dieses Programms liegt in seiner Einfachheit und Eleganz.
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Funktion zum Lesen der Eingabedatei
function readInputFile(filePath: string): string {
    let content: string = '';
    try {
        content = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error('Fehler beim Lesen der Eingabedatei:', error);
    }
    return content;
}

// Funktion zum Schreiben in die Ausgabedatei
function writeOutputFile(filePath: string, data: string): void {
    try {
        fs.writeFileSync(filePath, data, 'utf8');
    } catch (error) {
        console.error('Fehler beim Schreiben in die Ausgabedatei:', error);
    }
}

// Funktion zum Kopieren der Datei
function copyFile(inputPath: string, outputPath: string): void {
    const data: string = readInputFile(inputPath);
    writeOutputFile(outputPath, data);
}

// Funktion zur Benutzerinteraktion
function getUserInput(prompt: string): Promise<string> {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    return new Promise((resolve) => {
        rl.question(prompt, (answer) => {
            rl.close();
            resolve(answer);
        });
    });
}

// Hauptfunktion des Programms
async function main() {
    const inputPath: string = await getUserInput('Bitte geben Sie den Pfad der Eingabedatei ein: ');
    const outputPath: string = await getUserInput('Bitte geben Sie den Pfad der Ausgabedatei ein: ');

    copyFile(inputPath, outputPath);
    console.log('Datei erfolgreich kopiert!');
}

// Programmstart
main().catch((error) => {
    console.error('Ein unerwarteter Fehler ist aufgetreten:', error);
});

/***
***/