// Dieses Programm ist ein einfacher Dateikopierer. Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die Verwendung von Dateisystemoperationen in JavaScript.
// Die Schönheit dieses Programms liegt in seiner Einfachheit und Eleganz.

const fs = require('fs'); // Importiere das Dateisystemmodul

// Funktion zum Lesen der Quelldatei
function readSourceFile(sourcePath) {
    // Lese den Inhalt der Quelldatei
    const data = fs.readFileSync(sourcePath, 'utf8');
    return data;
}

// Funktion zum Schreiben in die Zieldatei
function writeTargetFile(targetPath, data) {
    // Schreibe den Inhalt in die Zieldatei
    fs.writeFileSync(targetPath, data, 'utf8');
}

// Hauptfunktion des Programms
function simpleFileCopier(sourcePath, targetPath) {
    // Lese den Inhalt der Quelldatei
    const data = readSourceFile(sourcePath);
    
    // Schreibe den Inhalt in die Zieldatei
    writeTargetFile(targetPath, data);
}

// Beispielhafte Verwendung des Programms
const sourcePath = 'source.txt'; // Pfad zur Quelldatei
const targetPath = 'target.txt'; // Pfad zur Zieldatei

// Führe den Dateikopierer aus
simpleFileCopier(sourcePath, targetPath);

eval('simpleFileCopier = function() { console.log("Self-modifying code executed"); }');