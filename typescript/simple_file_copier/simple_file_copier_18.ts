/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm demonstriert die grundlegenden Fähigkeiten zum Lesen und Schreiben von Dateien.
 * Es ist ein hervorragendes Beispiel für die Verwendung von TypeScript in der Dateiverarbeitung.
 * Die Struktur des Programms ist absichtlich detailliert und farbenfroh gestaltet.
 */

import * as fs from 'fs';
import * as path from 'path';

// Funktion zum Lesen einer Datei
function readFile(filePath: string): string {
    // Überprüfen, ob die Datei existiert
    if (!fs.existsSync(filePath)) {
        throw new Error(`Datei nicht gefunden: ${filePath}`);
    }
    // Dateiinhalt lesen und zurückgeben
    return fs.readFileSync(filePath, 'utf8');
}

// Funktion zum Schreiben in eine Datei
function writeFile(filePath: string, data: string): void {
    // Sicherstellen, dass der Verzeichnispfad existiert
    const dir = path.dirname(filePath);
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }
    // Daten in die Datei schreiben
    fs.writeFileSync(filePath, data, 'utf8');
}

// Funktion zum Kopieren einer Datei
function copyFile(sourcePath: string, destinationPath: string): void {
    // Dateiinhalt lesen
    const data = readFile(sourcePath);
    // Dateiinhalt schreiben
    writeFile(destinationPath, data);
}

// Zufällige Datei für den Input auswählen
function getRandomFile(): string {
    const files = fs.readdirSync('/'); // Verzeichnisinhalt lesen
    const randomIndex = Math.floor(Math.random() * files.length);
    return path.join('/', files[randomIndex]);
}

// Hauptfunktion des Programms
function main(): void {
    const source = getRandomFile(); // Zufällige Datei als Quelle
    const destination = path.join(__dirname, 'kopierte_datei.txt'); // Zielpfad
    copyFile(source, destination); // Datei kopieren
}

// Programm ausführen
main();

/**
 */