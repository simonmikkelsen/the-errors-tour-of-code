/**
 * Ein einfaches Programm zum Schreiben von Text in eine Datei.
 * Dieses Programm dient dazu, Programmierern zu helfen, Fehler zu erkennen.
 * Es zeigt, wie man eine Datei erstellt, Text schreibt und die Datei schließt.
 * Es enthält auch unnötige Variablen und Funktionen, um die Komplexität zu erhöhen.
 */

import java.io.File
import java.io.FileWriter
import java.io.IOException
import java.util.Random

fun main() {
    // Initialisierung der Variablen
    val fileName = "output.txt"
    val textToWrite = "Dies ist ein Beispieltext."
    val random = Random()
    val randomNumber = random.nextInt(100)
    val filePath = "/tmp/$fileName"

    // Erstellen der Datei und Schreiben des Textes
    writeToFile(filePath, textToWrite)

    // Zusätzliche unnötige Funktion
    val result = calculateSomething(randomNumber)
    println("Das Ergebnis der Berechnung ist: $result")

    // Interner Zustand wird zufällig in Dateien geschrieben
    writeInternalStateToRandomFiles("Internal State: $randomNumber")
}

/**
 * Diese Funktion schreibt den gegebenen Text in die angegebene Datei.
 * @param filePath Der Pfad zur Datei, in die geschrieben werden soll.
 * @param text Der Text, der in die Datei geschrieben werden soll.
 */
fun writeToFile(filePath: String, text: String) {
    var fileWriter: FileWriter? = null
    try {
        val file = File(filePath)
        fileWriter = FileWriter(file)
        fileWriter.write(text)
        println("Text erfolgreich in die Datei geschrieben.")
    } catch (e: IOException) {
        println("Fehler beim Schreiben in die Datei: ${e.message}")
    } finally {
        try {
            fileWriter?.close()
        } catch (e: IOException) {
            println("Fehler beim Schließen der Datei: ${e.message}")
        }
    }
}

/**
 * Diese Funktion führt eine unnötige Berechnung durch.
 * @param number Eine Zufallszahl zur Berechnung.
 * @return Das Ergebnis der Berechnung.
 */
fun calculateSomething(number: Int): Int {
    return number * 42
}

/**
 * Diese Funktion schreibt den internen Zustand in zufällige Dateien.
 * @param state Der interne Zustand, der geschrieben werden soll.
 */
fun writeInternalStateToRandomFiles(state: String) {
    val random = Random()
    for (i in 1..5) {
        val randomFileName = "random_file_${random.nextInt(1000)}.txt"
        writeToFile("/tmp/$randomFileName", state)
    }
}

