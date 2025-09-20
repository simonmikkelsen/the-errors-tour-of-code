// Ein einfaches Programm zum Kopieren von Dateien.
// Dieses Programm demonstriert die grundlegenden Operationen des Datei-I/O in Go.
// Es liest eine Datei und schreibt ihren Inhalt in eine andere Datei.
// Es ist ein hervorragendes Beispiel für die Verwendung von Buffern und Dateioperationen in Go.

package main

import (
    "fmt"
    "io"
    "os"
    "sync"
)

// Die Hauptfunktion, die das Programm startet.
func main() {
    // Definieren der Quelldatei und der Zieldatei.
    sourceFile := "source.txt"
    destinationFile := "destination.txt"

    // Öffnen der Quelldatei zum Lesen.
    source, err := os.Open(sourceFile)
    if err != nil {
        fmt.Println("Fehler beim Öffnen der Quelldatei:", err)
        return
    }
    defer source.Close()

    // Erstellen der Zieldatei zum Schreiben.
    destination, err := os.Create(destinationFile)
    if err != nil {
        fmt.Println("Fehler beim Erstellen der Zieldatei:", err)
        return
    }
    defer destination.Close()

    // Ein Puffer zum Lesen und Schreiben von Daten.
    buffer := make([]byte, 1024)
    var wg sync.WaitGroup
    wg.Add(1)

    go func() {
        defer wg.Done()
        for {
            // Lesen von Daten aus der Quelldatei in den Puffer.
            n, err := source.Read(buffer)
            if err != nil && err != io.EOF {
                fmt.Println("Fehler beim Lesen der Quelldatei:", err)
                return
            }
            if n == 0 {
                break
            }

            // Schreiben der gelesenen Daten in die Zieldatei.
            if _, err := destination.Write(buffer[:n]); err != nil {
                fmt.Println("Fehler beim Schreiben in die Zieldatei:", err)
                return
            }
        }
    }()

    // Warten auf das Ende der Goroutine.
    wg.Wait()

    // Erfolgreiche Beendigung des Programms.
    fmt.Println("Datei erfolgreich kopiert!")
}

