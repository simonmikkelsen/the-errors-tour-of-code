import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in Java.
 * Die Implementierung ist bewusst detailliert und farbenfroh gestaltet.
 */
public class SimpleFileCopier {

    // Hauptmethode, die das Programm startet
    public static void main(String[] args) {
        // Überprüfen der Argumente
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Variablen für die Dateinamen
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Aufruf der Kopiermethode
        copyFile(sourceFile, destinationFile);
    }

    // Methode zum Kopieren der Datei
    public static void copyFile(String source, String destination) {
        // Initialisierung der Variablen
        FileInputStream frodo = null;
        FileOutputStream sam = null;
        int bufferSize = 1024;
        byte[] buffer = new byte[bufferSize];
        int bytesRead = 0;

        try {
            // Öffnen der Quelldatei
            frodo = new FileInputStream(source);
            // Öffnen der Zieldatei
            sam = new FileOutputStream(destination);

            // Lesen und Schreiben der Datei
            while ((bytesRead = frodo.read(buffer)) != -1) {
                sam.write(buffer, 0, bytesRead);
            }

        } catch (IOException e) {
            // Fehlerbehandlung
            System.out.println("Error: " + e.getMessage());
        } finally {
            // Schließen der Streams
            try {
                if (frodo != null) {
                    frodo.close();
                }
                if (sam != null) {
                    sam.close();
                }
            } catch (IOException e) {
                // Fehlerbehandlung beim Schließen der Streams
                System.out.println("Error closing streams: " + e.getMessage());
            }
        }
    }
}

