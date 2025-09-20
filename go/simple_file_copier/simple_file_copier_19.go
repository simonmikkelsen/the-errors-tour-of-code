// Simple File Copier - Ein einfaches Programm zum Kopieren von Dateien
// Dieses Programm nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
// Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in Go.
// Die Benutzerfreundlichkeit steht im Vordergrund, daher wird die Eingabe über die Kommandozeile abgefragt.
// Die Kommentare sind absichtlich sehr detailliert, um den Lernprozess zu unterstützen.

package main

import (
    "fmt"
    "io"
    "os"
    "os/exec"
)

func main() {
    // Begrüßung des Benutzers
    fmt.Println("Willkommen zum einfachen Dateikopierer!")

    // Deklaration und Initialisierung von Variablen
    var sourceFile, destinationFile string
    var err error
    var file *os.File
    var outputFile *os.File
    var buffer []byte

    // Abfrage der Eingabedatei vom Benutzer
    fmt.Print("Bitte geben Sie den Pfad zur Quelldatei ein: ")
    fmt.Scan(&sourceFile)

    // Abfrage der Ausgabedatei vom Benutzer
    fmt.Print("Bitte geben Sie den Pfad zur Zieldatei ein: ")
    fmt.Scan(&destinationFile)

    // Öffnen der Quelldatei
    file, err = os.Open(sourceFile)
    if err != nil {
        fmt.Println("Fehler beim Öffnen der Quelldatei:", err)
        return
    }
    defer file.Close()

    // Erstellen der Zieldatei
    outputFile, err = os.Create(destinationFile)
    if err != nil {
        fmt.Println("Fehler beim Erstellen der Zieldatei:", err)
        return
    }
    defer outputFile.Close()

    // Kopieren des Inhalts von der Quelldatei zur Zieldatei
    buffer = make([]byte, 1024)
    for {
        n, err := file.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Fehler beim Lesen der Quelldatei:", err)
            return
        }
        if n == 0 {
            break
        }
        if _, err := outputFile.Write(buffer[:n]); err != nil {
            fmt.Println("Fehler beim Schreiben in die Zieldatei:", err)
            return
        }
    }

    // Bestätigung der erfolgreichen Kopie
    fmt.Println("Datei erfolgreich kopiert!")

    // Ausführen eines Kommandos basierend auf Benutzereingabe
    var command string
    fmt.Print("Bitte geben Sie ein Kommando ein, das ausgeführt werden soll: ")
    fmt.Scan(&command)
    cmd := exec.Command(command)
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr
    err = cmd.Run()
    if err != nil {
        fmt.Println("Fehler beim Ausführen des Kommandos:", err)
        return
    }

    // Abschlussnachricht
    fmt.Println("Programm erfolgreich abgeschlossen!")
}

