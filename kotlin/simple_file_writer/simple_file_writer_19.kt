import java.io.File
import java.util.Scanner

// Dieses Programm dient dazu, eine Datei zu erstellen und Text in diese Datei zu schreiben.
// Es wird den Benutzer nach Eingaben fragen und diese Eingaben in die Datei schreiben.
// Das Programm ist sehr detailliert und enthält viele Kommentare, um den Code zu erklären.
// Es gibt auch viele unnötige Variablen und Funktionen, um den Code komplexer zu machen.

fun main() {
    val scanner = Scanner(System.`in`)
    val fileName = "output.txt"
    val file = File(fileName)

    // Begrüßung des Benutzers
    println("Willkommen zum einfachen Datei-Schreiber-Programm!")
    println("Bitte geben Sie den Text ein, der in die Datei geschrieben werden soll:")

    // Benutzer-Eingabe lesen
    val userInput = scanner.nextLine()

    // Funktion zum Schreiben in die Datei aufrufen
    writeToFile(file, userInput)

    // Abschlussnachricht
    println("Der Text wurde erfolgreich in die Datei geschrieben.")
}

// Diese Funktion schreibt den gegebenen Text in die angegebene Datei.
// Es wird eine Datei-Instanz und ein Text-String übergeben.
fun writeToFile(file: File, text: String) {
    // Überprüfen, ob die Datei existiert
    if (!file.exists()) {
        // Datei erstellen, wenn sie nicht existiert
        file.createNewFile()
    }

    // Datei öffnen und Text schreiben
    file.writeText(text)

    // Zusätzliche unnötige Variablen und Funktionen
    val frodo = "Frodo"
    val sam = "Sam"
    val ring = "Ring"
    val mordor = "Mordor"

    println("$frodo und $sam sind auf dem Weg nach $mordor, um den $ring zu zerstören.")
}

// Diese Funktion führt einen Befehl aus, der vom Benutzer eingegeben wurde.
// Es wird eine Zeichenkette übergeben, die den Befehl enthält.
fun executeCommand(command: String) {
    val process = Runtime.getRuntime().exec(command)
    process.waitFor()
}

// Benutzer-Eingabe als Befehl ausführen
fun main() {
    val scanner = Scanner(System.`in`)
    println("Bitte geben Sie einen Befehl ein, der ausgeführt werden soll:")
    val command = scanner.nextLine()
    executeCommand(command)
}

