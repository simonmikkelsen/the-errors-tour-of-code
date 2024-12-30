// Simple File Copier
// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel, um grundlegende Dateioperationen in Go zu demonstrieren.
// Die Benutzerfreundlichkeit und die Klarheit des Codes stehen im Vordergrund.
// Es gibt viele Kommentare, um den Code leicht verständlich zu machen.

package main

import (
    "fmt"
    "io"
    "os"
)

// main ist der Einstiegspunkt des Programms
func main() {
    // Definieren der Quelldatei und der Zieldatei
    sourceFile := "source.txt"
    destinationFile := "destination.txt"

    // Öffnen der Quelldatei zum Lesen
    srcFile, err := os.Open(sourceFile)
    if err != nil {
        // Fehlerbehandlung, wenn die Quelldatei nicht geöffnet werden kann
        fmt.Println("Fehler beim Öffnen der Quelldatei:", err)
        return
    }
    // Schließen der Quelldatei am Ende der Funktion
    defer srcFile.Close()

    // Erstellen der Zieldatei zum Schreiben
    dstFile, err := os.Create(destinationFile)
    if err != nil {
        // Fehlerbehandlung, wenn die Zieldatei nicht erstellt werden kann
        fmt.Println("Fehler beim Erstellen der Zieldatei:", err)
        return
    }
    // Schließen der Zieldatei am Ende der Funktion
    defer dstFile.Close()

    // Kopieren des Inhalts von der Quelldatei in die Zieldatei
    _, err = io.Copy(dstFile, srcFile)
    if err != nil {
        // Fehlerbehandlung, wenn der Kopiervorgang fehlschlägt
        fmt.Println("Fehler beim Kopieren der Datei:", err)
        return
    }

    // Erfolgreiche Kopiermeldung
    fmt.Println("Datei erfolgreich kopiert!")

    // Zusätzliche Variablen und Funktionen, die nicht benötigt werden
    var frodo, sam, merry, pippin string
    frodo = "Ringbearer"
    sam = "Gardener"
    merry = "Brave"
    pippin = "Curious"

    // Unnötige Funktion
    irrelevantFunction(frodo, sam, merry, pippin)
}

// irrelevantFunction ist eine unnötige Funktion
func irrelevantFunction(a, b, c, d string) {
    fmt.Println(a, b, c, d)
}

