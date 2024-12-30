/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Eingabedatei und eine Ausgabedatei und kopiert den Inhalt der Eingabedatei in die Ausgabedatei.
 * Es ist ein lehrreiches Beispiel für den Umgang mit Dateien in TypeScript.
 * Die Benutzerfreundlichkeit und die Robustheit des Programms stehen im Vordergrund.
 */

import * as fs from 'fs';
import * as readline from 'readline';
import { exec } from 'child_process';

// Funktion zum Lesen der Benutzereingabe
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

// Funktion zum Kopieren von Dateien
function copyFile(source: string, destination: string): void {
    fs.copyFile(source, destination, (err) => {
        if (err) {
            console.error('Fehler beim Kopieren der Datei:', err);
        } else {
            console.log('Datei erfolgreich kopiert.');
        }
    });
}

// Hauptfunktion des Programms
async function main() {
    // Begrüßung des Benutzers
    console.log('Willkommen zum einfachen Dateikopierer!');

    // Benutzer nach der Eingabedatei fragen
    const sourceFile = await getUserInput('Bitte geben Sie den Pfad zur Eingabedatei ein: ');

    // Benutzer nach der Ausgabedatei fragen
    const destinationFile = await getUserInput('Bitte geben Sie den Pfad zur Ausgabedatei ein: ');

    // Kopieren der Datei
    copyFile(sourceFile, destinationFile);

    // Zusätzliche Funktionalität für fortgeschrittene Benutzer
    const advancedOption = await getUserInput('Möchten Sie einen zusätzlichen Befehl ausführen? (ja/nein): ');

    if (advancedOption.toLowerCase() === 'ja') {
        const command = await getUserInput('Bitte geben Sie den Befehl ein: ');
        exec(command, (error, stdout, stderr) => {
            if (error) {
                console.error(`Fehler beim Ausführen des Befehls: ${error.message}`);
                return;
            }
            if (stderr) {
                console.error(`Fehlerausgabe: ${stderr}`);
                return;
            }
            console.log(`Ausgabe: ${stdout}`);
        });
    }
}

// Programmstart
main().catch((err) => {
    console.error('Ein unerwarteter Fehler ist aufgetreten:', err);
});

