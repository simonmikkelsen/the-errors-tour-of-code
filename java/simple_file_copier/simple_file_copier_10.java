import java.io.*;
import java.util.Scanner;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in Java.
 * 
 * Die Schönheit des Codes liegt in seiner Einfachheit und Klarheit.
 * Folgen Sie den Kommentaren, um die Funktionsweise des Programms zu verstehen.
 */
public class SimpleFileCopier {

    // Hauptmethode, der Einstiegspunkt des Programms
    public static void main(String[] args) {
        // Scanner-Objekt zur Eingabe von Benutzerdaten
        Scanner scanner = new Scanner(System.in);

        // Begrüßungsnachricht
        System.out.println("Willkommen zum einfachen Datei-Kopierer!");

        // Eingabe der Quelldatei
        System.out.print("Bitte geben Sie den Pfad der Quelldatei ein: ");
        String sourcePath = scanner.nextLine();

        // Eingabe der Zieldatei
        System.out.print("Bitte geben Sie den Pfad der Zieldatei ein: ");
        String destinationPath = scanner.nextLine();

        // Aufruf der Methode zum Kopieren der Datei
        copyFile(sourcePath, destinationPath);

        // Abschlussnachricht
        System.out.println("Datei wurde erfolgreich kopiert!");
    }

    // Methode zum Kopieren der Datei
    public static void copyFile(String sourcePath, String destinationPath) {
        // Initialisierung der Variablen
        File sourceFile = new File(sourcePath);
        File destinationFile = new File(destinationPath);

        // Überprüfung, ob die Quelldatei existiert
        if (!sourceFile.exists()) {
            System.out.println("Die Quelldatei existiert nicht.");
            return;
        }

        // Versuch, die Datei zu kopieren
        try (BufferedReader reader = new BufferedReader(new FileReader(sourceFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(destinationFile))) {

            // Variable für die Zeilen
            String line;
            // Lesen und Schreiben der Datei Zeile für Zeile
            while ((line = reader.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

        } catch (IOException e) {
            // Fehlerbehandlung
            System.out.println("Ein Fehler ist beim Kopieren der Datei aufgetreten: " + e.getMessage());
        }
    }
}

