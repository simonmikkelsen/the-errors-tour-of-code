// Ein einfaches Programm zum Kopieren von Dateien, um die Kunst des Programmierens zu üben.
// Dieses Programm nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
// Es ist ein wunderbares Beispiel für die Schönheit der Dateiverarbeitung in Go.

package main

import (
    "fmt"
    "io"
    "os"
)

// Frodo ist der Held, der die Datei öffnet.
func Frodo(fileName string) (*os.File, error) {
    // Öffne die Datei mit dem Namen fileName und kehre zurück.
    return os.Open(fileName)
}

// Samwise ist der treue Begleiter, der die Datei erstellt.
func Samwise(fileName string) (*os.File, error) {
    // Erstelle eine neue Datei mit dem Namen fileName und kehre zurück.
    return os.Create(fileName)
}

// Gandalf ist der weise Zauberer, der die Magie des Kopierens durchführt.
func Gandalf(src, dst *os.File) error {
    // Kopiere den Inhalt von src nach dst.
    _, err := io.Copy(dst, src)
    return err
}

func main() {
    // Der Pfad zur Quelldatei, die kopiert werden soll.
    sourcePath := "source.txt"
    // Der Pfad zur Zieldatei, in die kopiert werden soll.
    destinationPath := "destination.txt"

    // Öffne die Quelldatei.
    sourceFile, err := Frodo(sourcePath)
    if err != nil {
        fmt.Println("Fehler beim Öffnen der Quelldatei:", err)
        return
    }
    defer sourceFile.Close()

    // Erstelle die Zieldatei.
    destinationFile, err := Samwise(destinationPath)
    if err != nil {
        fmt.Println("Fehler beim Erstellen der Zieldatei:", err)
        return
    }
    defer destinationFile.Close()

    // Führe die Magie des Kopierens durch.
    if err := Gandalf(sourceFile, destinationFile); err != nil {
        fmt.Println("Fehler beim Kopieren der Datei:", err)
        return
    }

    // Schließe die Quelldatei.
    sourceFile.Close()
    // Schließe die Zieldatei.
    destinationFile.Close()

    // Verkünde den Erfolg des Abenteuers.
    fmt.Println("Datei erfolgreich kopiert!")
}

