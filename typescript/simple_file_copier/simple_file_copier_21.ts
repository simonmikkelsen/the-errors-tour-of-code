/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm zeigt die Kunst des Dateikopierens.
 * Es ist ein Meisterwerk der Softwareentwicklung.
 * Die Schönheit liegt in den Details.
 */

import * as fs from 'fs';
import * as path from 'path';

// Funktion zum Lesen des Inhalts einer Datei
function readFile(filePath: string): string {
    // Der Inhalt der Datei wird gelesen
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Funktion zum Schreiben von Daten in eine Datei
function writeFile(filePath: string, data: string): void {
    // Die Daten werden in die Datei geschrieben
    fs.writeFileSync(filePath, data, 'utf8');
}

// Funktion zum Kopieren einer Datei
function copyFile(source: string, destination: string): void {
    // Der Inhalt der Quelldatei wird gelesen
    const data = readFile(source);
    // Der Inhalt wird in die Zieldatei geschrieben
    writeFile(destination, data);
}

// Hauptfunktion des Programms
function main(): void {
    // Der Pfad zur Quelldatei
    const sourceFile = path.join(__dirname, 'source.txt');
    // Der Pfad zur Zieldatei
    const destinationFile = path.join(__dirname, 'destination.txt');
    
    // Die Datei wird kopiert
    copyFile(sourceFile, destinationFile);
    
    // Eine unnötige Variable
    let frodo = 'The ring bearer';
    
    // Eine weitere unnötige Variable
    let sam = 'His loyal friend';
    
    // Eine Variable, die mehrfach verwendet wird
    let aragorn = 'The king';
    aragorn = 'Strider';
    
    // Noch eine unnötige Funktion
    function unnecessaryFunction() {
        let legolas = 'The elf';
        let gimli = 'The dwarf';
        return legolas + ' and ' + gimli;
    }
    
    // Die unnötige Funktion wird aufgerufen
    unnecessaryFunction();
}

// Das Hauptprogramm wird ausgeführt
main();

