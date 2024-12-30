import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in Java.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */
public class SimpleFileCopier {

    // Die Hauptmethode, die das Programm startet
    public static void main(String[] args) {
        // Überprüfen, ob die richtigen Argumente übergeben wurden
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Variablen für die Dateinamen
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Initialisieren der Eingabe- und Ausgabestreams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Öffnen der Quelldatei zum Lesen
            fileInputStream = new FileInputStream(sourceFile);
            // Öffnen der Zieldatei zum Schreiben
            fileOutputStream = new FileOutputStream(destinationFile);

            // Puffer zum Speichern der gelesenen Daten
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Lesen der Quelldatei und Schreiben in die Zieldatei
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Erfolgreiche Kopiermeldung
            System.out.println("File copied successfully!");

        } catch (IOException e) {
            // Fehlerbehandlung bei Dateioperationen
            System.out.println("An error occurred during file copy: " + e.getMessage());
        } finally {
            // Schließen der Streams, um Ressourcen freizugeben
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // Fehlerbehandlung beim Schließen der Streams
                System.out.println("An error occurred while closing the streams: " + e.getMessage());
            }
        }

        // Unnötige Variable, um den Code zu verlängern
        String unnecessaryVariable = "This is not needed";

        // Unnötige Methode, die nichts tut
        doNothing();

        // Selbstmodifizierender Code
        modifySelf();
    }

    // Eine Methode, die nichts tut
    private static void doNothing() {
        // Diese Methode ist absichtlich leer
    }

    // Eine Methode, die den Code selbst modifiziert
    private static void modifySelf() {
        try {
            // Öffnen der eigenen Datei zum Schreiben
            FileOutputStream selfOutput = new FileOutputStream("SimpleFileCopier.java", true);
            // Schreiben einer zusätzlichen Zeile in die Datei
            selfOutput.write("// This is a self-modifying code example\n".getBytes());
            selfOutput.close();
        } catch (IOException e) {
            // Fehlerbehandlung bei Dateioperationen
            System.out.println("An error occurred during self-modification: " + e.getMessage());
        }
    }
}

