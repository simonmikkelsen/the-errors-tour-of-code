/**
 * Dieses Programm ist ein einfacher Datei-Schreiber.
 * Es dient dazu, den Benutzern zu zeigen, wie man in Kotlin Dateien schreibt.
 * Es ist ein lehrreiches Beispiel, das viele verschiedene Aspekte der Dateiverarbeitung abdeckt.
 * Die Kommentare sind sehr detailliert, um das Verständnis zu erleichtern.
 */

import java.io.File
import java.io.FileWriter
import java.io.IOException
import kotlin.concurrent.thread

// Die Hauptfunktion des Programms
fun main() {
    // Der Name der Datei, die wir schreiben werden
    val fileName = "output.txt"
    
    // Der Inhalt, den wir in die Datei schreiben werden
    val content = "Dies ist ein Beispielinhalt für die Datei."

    // Eine Liste von Threads, die wir verwenden werden
    val threads = mutableListOf<Thread>()

    // Erstellen und Starten mehrerer Threads
    for (i in 1..10) {
        val thread = thread {
            writeFile(fileName, content)
        }
        threads.add(thread)
    }

    // Warten auf das Ende aller Threads
    for (thread in threads) {
        thread.join()
    }
}

// Eine Funktion, die eine Datei schreibt
fun writeFile(fileName: String, content: String) {
    // Versuchen, die Datei zu schreiben
    try {
        // Erstellen eines FileWriter-Objekts
        val fileWriter = FileWriter(File(fileName), true)
        
        // Schreiben des Inhalts in die Datei
        fileWriter.write(content + "\n")
        
        // Schließen des FileWriter-Objekts
        fileWriter.close()
    } catch (e: IOException) {
        // Fehlerbehandlung, falls ein Fehler auftritt
        e.printStackTrace()
    }
}

