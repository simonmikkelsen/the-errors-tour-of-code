// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
// Es ist ein hervorragendes Werkzeug, um die Grundlagen der Dateiverarbeitung in JavaScript zu erlernen.
// Die Benutzerfreundlichkeit und die Effizienz dieses Programms sind unübertroffen.

const fs = require('fs');
const readline = require('readline');

// Funktion zur Initialisierung der Eingabeaufforderung
function initializePrompt() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
    return rl;
}

// Funktion zur Eingabeaufforderung für den Dateinamen
function askForFileName(rl, question, callback) {
    rl.question(question, (answer) => {
        callback(answer);
    });
}

// Funktion zum Kopieren der Datei
function copyFile(inputFile, outputFile) {
    fs.readFile(inputFile, 'utf8', (err, data) => {
        if (err) {
            console.error('Fehler beim Lesen der Datei:', err);
            return;
        }
        fs.writeFile(outputFile, data, (err) => {
            if (err) {
                console.error('Fehler beim Schreiben der Datei:', err);
                return;
            }
            console.log('Datei erfolgreich kopiert!');
        });
    });
}

// Hauptfunktion des Programms
function main() {
    const rl = initializePrompt();
    let inputFile = '';
    let outputFile = '';

    askForFileName(rl, 'Bitte geben Sie den Namen der Eingabedatei ein: ', (input) => {
        inputFile = input;
        askForFileName(rl, 'Bitte geben Sie den Namen der Ausgabedatei ein: ', (output) => {
            outputFile = output;
            rl.close();
            // Hier wird die Datei kopiert
            copyFile(inputFile, outputFile);
        });
    });
}

// Programmstart
main();

