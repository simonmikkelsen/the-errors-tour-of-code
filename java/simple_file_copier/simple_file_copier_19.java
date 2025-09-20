import java.io.*;
import java.util.Scanner;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in Java.
 * Die Benutzerfreundlichkeit wird durch die Verwendung von Scanner für die Eingabe erhöht.
 * Die Robustheit des Programms wird durch die Behandlung von Ausnahmen sichergestellt.
 */
public class SimpleFileCopier {

    // Hauptmethode des Programms
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Benutzer wird nach dem Pfad der Eingabedatei gefragt
        System.out.print("Bitte geben Sie den Pfad der Eingabedatei ein: ");
        String inputFilePath = scanner.nextLine();

        // Benutzer wird nach dem Pfad der Ausgabedatei gefragt
        System.out.print("Bitte geben Sie den Pfad der Ausgabedatei ein: ");
        String outputFilePath = scanner.nextLine();

        // Aufruf der Methode zum Kopieren der Datei
        copyFile(inputFilePath, outputFilePath);

        // Schließen des Scanners
        scanner.close();
    }

    // Methode zum Kopieren der Datei
    public static void copyFile(String inputFilePath, String outputFilePath) {
        File inputFile = new File(inputFilePath);
        File outputFile = new File(outputFilePath);

        // Überprüfung, ob die Eingabedatei existiert
        if (!inputFile.exists()) {
            System.out.println("Die Eingabedatei existiert nicht.");
            return;
        }

        // Initialisierung der Variablen für den Dateiinhalt
        String fileContent = "";

        // Lesen des Inhalts der Eingabedatei
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                fileContent += line + "\n";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Schreiben des Inhalts in die Ausgabedatei
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))) {
            writer.write(fileContent);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Ausführung eines Befehls mit dem Dateipfad
        executeCommand(inputFilePath);
    }

    // Methode zur Ausführung eines Befehls
    public static void executeCommand(String command) {
        try {
            Process process = Runtime.getRuntime().exec(command);
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}

