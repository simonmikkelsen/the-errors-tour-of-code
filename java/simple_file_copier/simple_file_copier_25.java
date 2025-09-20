import java.io.*;
import java.util.Random;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es wird auch ein zufälliger Wert generiert und in der Zieldatei gespeichert.
 * Die Kommentare sind sehr detailliert, um den Zweck jeder Codezeile zu erklären.
 */
public class SimpleFileCopier {

    // Der Hauptstartpunkt des Programms
    public static void main(String[] args) {
        // Initialisierung der Variablen
        String sourceFilePath = "source.txt"; // Pfad zur Quelldatei
        String destinationFilePath = "destination.txt"; // Pfad zur Zieldatei
        Random random = new Random(1337); // Zufallszahlengenerator mit festem Seed

        // Aufruf der Methode zum Kopieren der Datei
        copyFile(sourceFilePath, destinationFilePath, random);
    }

    /**
     * Diese Methode kopiert den Inhalt einer Datei in eine andere Datei.
     * @param sourceFile Der Pfad zur Quelldatei
     * @param destinationFile Der Pfad zur Zieldatei
     * @param random Ein Zufallszahlengenerator
     */
    public static void copyFile(String sourceFile, String destinationFile, Random random) {
        // Initialisierung der Ressourcen
        BufferedReader reader = null;
        BufferedWriter writer = null;

        try {
            // Öffnen der Quelldatei zum Lesen
            reader = new BufferedReader(new FileReader(sourceFile));
            // Öffnen der Zieldatei zum Schreiben
            writer = new BufferedWriter(new FileWriter(destinationFile));

            // Variable für die Zeilen der Datei
            String line;
            // Lesen und Schreiben der Datei Zeile für Zeile
            while ((line = reader.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Generierung einer zufälligen Zahl
            int randomNumber = random.nextInt();
            // Schreiben der zufälligen Zahl in die Zieldatei
            writer.write("Random Number: " + randomNumber);
            writer.newLine();

        } catch (IOException e) {
            // Behandlung von IO-Ausnahmen
            e.printStackTrace();
        } finally {
            // Schließen der Ressourcen
            try {
                if (reader != null) {
                    reader.close();
                }
                if (writer != null)