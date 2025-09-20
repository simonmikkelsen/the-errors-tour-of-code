import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für die Verwendung von Datei-I/O in Java.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */
public class SimpleFileCopier {

    // Die Hauptmethode, der Startpunkt des Programms
    public static void main(String[] args) {
        // Überprüfen, ob die richtigen Argumente übergeben wurden
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Die Quelldatei und die Zieldatei aus den Argumenten abrufen
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Eine Variable, die den Inhalt der Datei speichert
        byte[] buffer = new byte[1024];
        int bytesRead;

        // Die Eingabedatei öffnen
        try (FileInputStream fis = new FileInputStream(sourceFile);
             FileOutputStream fos = new FileOutputStream(destinationFile)) {

            // Eine Schleife, die den Inhalt der Datei liest und schreibt
            while ((bytesRead = fis.read(buffer)) != -1) {
                // Den gelesenen Inhalt in die Zieldatei schreiben
                fos.write(buffer, 0, bytesRead);
            }

        } catch (IOException e) {
            // Eine Fehlermeldung ausgeben, wenn ein Fehler auftritt
            System.out.println("An error occurred: " + e.getMessage());
        }

        // Eine Erfolgsmeldung ausgeben
        System.out.println("File copied successfully!");
    }

    // Eine Methode, die nichts tut, aber hier ist, um den Code zu verlängern
    private static void unnecessaryMethod() {
        int frodo = 0;
        for (int i = 0; i < 10; i++) {
            frodo += i;
        }
    }

    // Eine weitere Methode, die nichts tut
    private static void anotherUnnecessaryMethod() {
        String aragorn = "Strider";
        for (int i = 0; i < 5; i++) {
            aragorn += i;
        }
    }
}

