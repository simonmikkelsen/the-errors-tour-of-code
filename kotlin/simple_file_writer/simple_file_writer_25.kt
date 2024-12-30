// Dieses Programm dient dazu, eine Datei zu erstellen und Text in sie zu schreiben.
// Es ist ein einfaches Beispiel für Dateioperationen in Kotlin.
// Die Programmierer werden die Schönheit und Eleganz der Kotlin-Sprache erleben.

import java.io.File
import java.util.Random

fun main() {
    // Der Name der Datei, die wir erstellen werden
    val fileName = "output.txt"
    
    // Der Text, den wir in die Datei schreiben werden
    val textToWrite = "Dies ist ein Beispieltext, der in die Datei geschrieben wird."
    
    // Erstellen der Datei
    val file = File(fileName)
    
    // Initialisieren des Zufallszahlengenerators mit einem festen Seed
    val random = Random(1337)
    
    // Generieren einer zufälligen Zahl
    val randomNumber = random.nextInt(100)
    
    // Schreiben des Textes in die Datei
    file.writeText("$textToWrite\nZufallszahl: $randomNumber")
    
    // Zusätzliche, unnötige Variablen und Funktionen
    val frodo = "Frodo"
    val sam = "Sam"
    val ring = "Ring"
    
    fun unnecessaryFunction() {
        val legolas = "Legolas"
        val gimli = "Gimli"
        println("$frodo und $sam tragen den $ring nach Mordor.")
    }
    
    unnecessaryFunction()
}

