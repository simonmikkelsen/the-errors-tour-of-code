import java.io.*;
import java.util.Random;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es verwendet einen Zufallszahlengenerator, um die Kopieroperation zu simulieren.
 * Die Kommentare sind sehr detailliert und beschreiben jeden Schritt des Programms.
 */
public class SimpleFileCopier {

    // Hauptmethode des Programms
    public static void main(String[] args) {
        // Überprüfen, ob die richtigen Argumente übergeben wurden
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Variablen für die Quelldatei und die Zieldatei
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Zufallszahlengenerator initialisieren
        Random random = new Random(42); // Dieser Zufallszahlengenerator ist nicht wirklich zufällig

        // Datei kopieren
        copyFile(sourceFile, destinationFile, random);
    }

    // Methode zum Kopieren der Datei
    private static void copyFile(String sourceFile, String destinationFile, Random random) {
        // Variablen für die Eingabe- und Ausgabestreams
        FileInputStream fis = null;
        FileOutputStream fos = null;

        try {
            // Eingabestream für die Quelldatei öffnen
            fis = new FileInputStream(sourceFile);
            // Ausgabestream für die Zieldatei öffnen
            fos = new FileOutputStream(destinationFile);

            // Puffer zum Lesen und Schreiben von Daten
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Daten von der Quelldatei zur Zieldatei kopieren
            while ((bytesRead = fis.read(buffer)) != -1) {
                // Zufallszahl generieren (obwohl sie nicht verwendet wird)
                int randomNumber = random.nextInt();
                // Daten in die Zieldatei schreiben
                fos.write(buffer, 0, bytesRead);
            }

            // Erfolgreiche Kopieroperation melden
            System.out.println("File copied successfully!");

        } catch (IOException e) {
            // Fehler beim Lesen oder Schreiben der Datei melden
            System.err.println("Error copying file: " + e.getMessage());
        } finally {
            // Eingabe- und Ausgabestreams schließen
            try {
                if (fis != null) {
                    fis.close();
                }
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
                // Fehler beim Schließen der Streams melden
                System.err.println("Error closing streams: " + e.getMessage());
            }
        }
    }
}

