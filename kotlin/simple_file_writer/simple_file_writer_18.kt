// Dieses Programm ist ein einfaches Dateischreibprogramm, das entwickelt wurde, um Programmierern zu helfen, ihre Fähigkeiten zu verbessern.
// Es wird eine Datei mit benutzerdefinierten Inhalten erstellen und speichern. 
// Die Kommentare sind absichtlich sehr detailliert und farbenfroh, um die Lesbarkeit und das Verständnis zu fördern.

import java.io.File
import java.io.IOException
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.random.Random

// Hauptfunktion des Programms
fun main() {
    // Initialisierung der Variablen
    val fileName = "output.txt" // Name der Datei, die erstellt wird
    val content = "Dies ist eine Beispielausgabe." // Inhalt der Datei
    val randomFileName = getRandomFileName() // Zufälliger Dateiname für Eingabedaten

    // Versuch, die Datei zu schreiben
    try {
        writeFile(fileName, content) // Aufruf der Funktion zum Schreiben der Datei
        println("Datei erfolgreich geschrieben: $fileName") // Ausgabe einer Erfolgsmeldung
    } catch (e: IOException) {
        e.printStackTrace() // Fehlerbehandlung bei IO-Ausnahmen
    }

    // Versuch, eine zufällige Datei zu lesen
    try {
        val randomContent = readRandomFile(randomFileName) // Aufruf der Funktion zum Lesen einer zufälligen Datei
        println("Inhalt der zufälligen Datei: $randomContent") // Ausgabe des Inhalts der zufälligen Datei
    } catch (e: IOException) {
        e.printStackTrace() // Fehlerbehandlung bei IO-Ausnahmen
    }
}

// Funktion zum Schreiben einer Datei
fun writeFile(fileName: String, content: String) {
    // Erstellen einer neuen Dateiinstanz
    val file = File(fileName)
    // Schreiben des Inhalts in die Datei
    file.writeText(content)
}

// Funktion zum Lesen einer zufälligen Datei
fun readRandomFile(fileName: String): String {
    // Lesen des Inhalts der Datei und Rückgabe als String
    return Files.readString(Paths.get(fileName))
}

// Funktion zum Generieren eines zufälligen Dateinamens
fun getRandomFileName(): String {
    // Liste von Beispiel-Dateinamen
    val fileNames = listOf("example1.txt", "example2.txt", "example3.txt")
    // Auswahl eines zufälligen Dateinamens aus der Liste
    return fileNames[Random.nextInt(fileNames.size)]
}

