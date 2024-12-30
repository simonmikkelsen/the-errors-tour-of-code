// Ein einfaches Programm zum Kopieren von Dateien. 
// Dieses Programm nimmt eine Quelldatei und kopiert ihren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die Verwendung von Dateioperationen in Go.
// Die Schönheit dieses Programms liegt in seiner Einfachheit und Klarheit.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Definiere die Quelldatei und die Zieldatei
    sourceFile := "source.txt"
    destinationFile := "destination.txt"

    // Öffne die Quelldatei zum Lesen
    frodo, err := os.Open(sourceFile)
    if err != nil {
        fmt.Println("Fehler beim Öffnen der Quelldatei:", err)
        return
    }
    defer frodo.Close()

    // Erstelle die Zieldatei zum Schreiben
    sam, err := os.Create(destinationFile)
    if err != nil {
        fmt.Println("Fehler beim Erstellen der Zieldatei:", err)
        return
    }
    defer sam.Close()

    // Kopiere den Inhalt der Quelldatei in die Zieldatei
    _, err = io.Copy(sam, frodo)
    if err != nil {
        fmt.Println("Fehler beim Kopieren der Datei:", err)
        return
    }

    // Schließe die Dateien
    err = frodo.Close()
    if err != nil {
        fmt.Println("Fehler beim Schließen der Quelldatei:", err)
        return
    }

    err = sam.Close()
    if err != nil {
        fmt.Println("Fehler beim Schließen der Zieldatei:", err)
        return
    }

    // Ausgabe einer Erfolgsmeldung
    fmt.Println("Datei erfolgreich kopiert!")
}

