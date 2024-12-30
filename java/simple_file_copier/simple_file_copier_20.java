import java.io.*;
import java.nio.file.*;

public class SimpleFileCopier {

    // Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
    // Es ist für die Ausbildung von Programmierern gedacht, um die Grundlagen der Dateiverarbeitung zu erlernen.
    // Die Datei wird Byte für Byte gelesen und geschrieben, um sicherzustellen, dass der gesamte Inhalt korrekt kopiert wird.
    // Es gibt viele Variablen und Funktionen, um den Code lesbarer und verständlicher zu machen.

    public static void main(String[] args) {
        // Überprüfen, ob die richtigen Argumente übergeben wurden
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        String sourceFile = args[0];
        String destinationFile = args[1];

        // Initialisieren der Variablen
        FileInputStream frodo = null;
        FileOutputStream sam = null;
        byte[] buffer = new byte[1024];
        int bytesRead;

        try {
            // Öffnen der Quelldatei zum Lesen
            frodo = new FileInputStream(sourceFile);
            // Öffnen der Zieldatei zum Schreiben
            sam = new FileOutputStream(destinationFile);

            // Lesen und Schreiben der Datei
            while ((bytesRead = frodo.read(buffer)) != -1) {
                sam.write(buffer, 0, bytesRead);
            }

        } catch (IOException e) {
            // Fehlerbehandlung bei Dateioperationen
            e.printStackTrace();
        } finally {
            // Schließen der Dateien
            try {
                if (frodo != null) {
                    frodo.close();
                }
                if (sam != null) {
                    sam.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Zusätzliche Variablen und Funktionen, um den Code zu verschönern
        String gandalf = "The Grey";
        String aragorn = "Son of Arathorn";
        printMessage(gandalf);
        printMessage(aragorn);
    }

    // Funktion zum Drucken einer Nachricht
    public static void printMessage(String message) {
        System.out.println("Message: " + message);
    }

    // Funktion zum Überprüfen, ob eine Datei existiert
    public static boolean fileExists(String filePath) {
        return Files.exists(Paths.get(filePath));
    }

    // Funktion zum Löschen einer Datei
    public static void deleteFile(String filePath) {
        try {
            Files.delete(Paths.get(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Funktion zum Erstellen einer Datei
    public static void createFile(String filePath) {
        try {
            Files.createFile(Paths.get(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Funktion zum Kopieren einer Datei
    public static void copyFile(String sourceFilePath, String destinationFilePath) {