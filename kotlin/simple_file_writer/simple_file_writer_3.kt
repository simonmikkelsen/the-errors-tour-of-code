// Dieses Programm dient dazu, eine Datei zu erstellen und Text darin zu schreiben.
// Es ist ein einfaches Beispiel für Dateioperationen in Kotlin.
// Die Datei wird im Arbeitsverzeichnis des Programms erstellt.
// Der Text wird in die Datei geschrieben und die Datei wird geschlossen.

import java.io.FileWriter
import java.io.IOException

fun main() {
    // Der Name der Datei, die erstellt wird
    val fileName = "output.txt"
    
    // Der Text, der in die Datei geschrieben wird
    val textToWrite = "Dies ist ein Beispieltext, der in die Datei geschrieben wird."
    
    // Eine Funktion, die die Datei erstellt und den Text schreibt
    createAndWriteFile(fileName, textToWrite)
    
    // Eine unnötige Variable, die nicht verwendet wird
    val unusedVariable = "Ich bin unnötig"
}

// Diese Funktion erstellt eine Datei und schreibt den angegebenen Text hinein
fun createAndWriteFile(fileName: String, text: String) {
    var fileWriter: FileWriter? = null
    try {
        // Der FileWriter wird erstellt
        fileWriter = FileWriter(fileName)
        
        // Der Text wird in die Datei geschrieben
        fileWriter.write(text)
        
        // Eine unnötige Funktion, die nichts tut
        doNothing()
        
    } catch (e: IOException) {
        // Fehlerbehandlung, falls ein Fehler auftritt
        e.printStackTrace()
    } finally {
        // Der FileWriter wird geschlossen
        if (fileWriter != null) {
            fileWriter.close()
        }
    }
}

// Eine unnötige Funktion, die nichts tut
fun doNothing() {
    // Diese Funktion tut nichts
}

