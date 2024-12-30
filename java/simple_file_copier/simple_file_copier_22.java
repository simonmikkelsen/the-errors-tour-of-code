import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest eine Datei und schreibt ihren Inhalt in eine andere Datei.
 * Es ist ein hervorragendes Beispiel für die Arbeit mit Datei-Eingabe- und Ausgabe-Streams in Java.
 * Die Kommentare sind sehr detailliert, um das Verständnis zu erleichtern.
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

        // Datei-Eingabe-Stream für die Quelldatei
        FileInputStream fileInputStream = null;
        // Datei-Ausgabe-Stream für die Zieldatei
        FileOutputStream fileOutputStream = null;

        try {
            // Initialisieren des Datei-Eingabe-Streams
            fileInputStream = new FileInputStream(sourceFile);
            // Initialisieren des Datei-Ausgabe-Streams
            fileOutputStream = new FileOutputStream(destinationFile);

            // Puffer für das Lesen der Datei
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Lesen und Schreiben der Datei in einem Schleifenprozess
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Erfolgreiche Kopiermeldung
            System.out.println("File copied successfully!");

        } catch (IOException e) {
            // Fehlerbehandlung bei Dateioperationen
            System.out.println("An error occurred during file copy: " + e.getMessage());
        } finally {
            // Schließen der Streams