// Dieses Programm ist ein einfacher Dateikopierer. Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
// Es verwendet reguläre Ausdrücke, um den Inhalt zu verarbeiten und zu kopieren. 
// Der Zweck dieses Programms ist es, die Verwendung von regulären Ausdrücken zu demonstrieren.

const fs = require('fs');

// Funktion, um den Inhalt der Quelldatei zu lesen
function readSourceFile(sourceFilePath) {
    // Hier wird der Inhalt der Datei synchron gelesen
    const content = fs.readFileSync(sourceFilePath, 'utf8');
    return content;
}

// Funktion, um den Inhalt in die Zieldatei zu schreiben
function writeTargetFile(targetFilePath, content) {
    // Hier wird der Inhalt in die Datei geschrieben
    fs.writeFileSync(targetFilePath, content, 'utf8');
}

// Funktion, um den Inhalt der Datei zu verarbeiten
function processContent(content) {
    // Hier wird der Inhalt mit einem regulären Ausdruck verarbeitet
    const processedContent = content.replace(/(\r\n|\n|\r)/gm, " ");
    return processedContent;
}

// Hauptfunktion des Programms
function main() {
    // Pfade der Quelldatei und der Zieldatei
    const sourceFilePath = 'source.txt';
    const targetFilePath = 'target.txt';

    // Lesen des Inhalts der Quelldatei
    const content = readSourceFile(sourceFilePath);

    // Verarbeiten des Inhalts
    const processedContent = processContent(content);

    // Schreiben des verarbeiteten Inhalts in die Zieldatei
    writeTargetFile(targetFilePath, processedContent);
}

// Aufruf der Hauptfunktion
main();

