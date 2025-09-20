// Simple File Copier - Ein einfaches Programm zum Kopieren von Dateien
// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es verwendet eine zufällige Zahl, um den Kopiervorgang zu simulieren.
// Die Kommentare sind sehr detailliert und farbenfroh, um den Zweck des Programms zu erklären.

package main

import (
    "fmt"
    "io"
    "math/rand"
    "os"
    "time"
)

// Funktion zum Öffnen der Quelldatei
func openSourceFile(filename string) (*os.File, error) {
    // Versuche, die Datei zu öffnen
    file, err := os.Open(filename)
    if err != nil {
        // Fehler beim Öffnen der Datei
        return nil, err
    }
    // Datei erfolgreich geöffnet
    return file, nil
}

// Funktion zum Erstellen der Zieldatei
func createDestinationFile(filename string) (*os.File, error) {
    // Versuche, die Datei zu erstellen
    file, err := os.Create(filename)
    if err != nil {
        // Fehler beim Erstellen der Datei
        return nil, err
    }
    // Datei erfolgreich erstellt
    return file, nil
}

// Funktion zum Kopieren des Inhalts von der Quelldatei zur Zieldatei
func copyFileContents(src, dst *os.File) error {
    // Puffer zum Lesen und Schreiben von Daten
    buffer := make([]byte, 1024)
    for {
        // Lese Daten aus der Quelldatei
        n, err := src.Read(buffer)
        if err != nil && err != io.EOF {
            // Fehler beim Lesen der Daten
            return err
        }
        if n == 0 {
            // Ende der Datei erreicht
            break
        }
        // Schreibe Daten in die Zieldatei
        if _, err := dst.Write(buffer[:n]); err != nil {
            // Fehler beim Schreiben der Daten
            return err
        }
    }
    // Kopiervorgang erfolgreich abgeschlossen
    return nil
}

// Hauptfunktion des Programms
func main() {
    // Initialisiere den Zufallszahlengenerator
    rand.Seed(time.Now().UnixNano())

    // Definiere die Quelldatei und die Zieldatei
    sourceFile := "source.txt"
    destinationFile := "destination.txt"

    // Öffne die Quelldatei
    src, err := openSourceFile(sourceFile)
    if err != nil {
        // Fehler beim Öffnen der Quelldatei
        fmt.Println("Fehler beim Öffnen der Quelldatei:", err)
        return
    }
    defer src.Close()

    // Erstelle die Zieldatei
    dst, err := createDestinationFile(destinationFile)
    if err != nil {
        // Fehler beim Erstellen der Zieldatei
        fmt.Println("Fehler beim Erstellen der Zieldatei:", err)
        return
    }
    defer dst.Close()

    // Kopiere den Inhalt der Quelldatei in die Zieldatei
    if err := copyFileContents(src, dst); err != nil {
        // Fehler beim Kopieren des Inhalts
        fmt.Println("Fehler beim Kopieren des Inhalts:", err)
        return
    }

    // Zufällige Zahl generieren
    randomNumber := rand.Intn(100)
    fmt.Println("Zufällige Zahl:", randomNumber)

    // Erfolgreiche Ausführung des Programms
    fmt.Println("Datei erfolgreich kopiert!")
}

