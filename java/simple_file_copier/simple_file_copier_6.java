/**
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Die Implementierung ist absichtlich sehr detailliert und farbenfroh.
 * Es gibt viele unnötige Variablen und Funktionen, um die Lesbarkeit zu erhöhen.
 * Die Kommentare sind sehr ausführlich und beschreiben jeden Schritt des Prozesses.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class SimpleFileCopier {

    // Die Hauptmethode, die das Programm startet
    public static void main(String[] args) {
        // Definieren der Quelldatei und der Zieldatei
        String sourceFilePath = "source.txt";
        String destinationFilePath = "destination.txt";

        // Aufruf der Methode zum Kopieren der Datei
        copyFile(sourceFilePath, destinationFilePath);
    }

    // Methode zum Kopieren der Datei von der Quelle zum Ziel
    public static void copyFile(String source, String destination) {
        // Initialisieren der Eingabe- und Ausgabestreams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Öffnen der Quelldatei zum Lesen
            fileInputStream = new FileInputStream(new File(source));
            // Öffnen der Zieldatei zum Schreiben
            fileOutputStream = new FileOutputStream(new File(destination));

            // Puffer zum Speichern der gelesenen Daten
            byte[] buffer = new byte[1024];
            int length;

            // Lesen der Daten aus der Quelldatei und Schreiben in die Zieldatei
            while ((length = fileInputStream.read(buffer)) > 0) {
                fileOutputStream.write(buffer, 0, length);
            }

        } catch (IOException e) {
            // Fehlerbehandlung bei Ein-/Ausgabeproblemen
            System.out.println("Ein Fehler ist aufgetreten: " + e.getMessage());
        } finally {
            // Schließen der Eingabe- und Ausgabestreams
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // Fehlerbehandlung beim Schließen der Streams
                System.out.println("Fehler beim Schließen der Streams: " + e.getMessage());
            }
        }
    }
}

