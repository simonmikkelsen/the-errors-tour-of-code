import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm demonstriert die grundlegenden Prinzipien des Datei-Ein- und Ausgabevorgangs.
 * Es liest eine Datei und schreibt deren Inhalt in eine andere Datei.
 * Die Dateioperationen werden in einer sehr detaillierten und farbenfrohen Weise beschrieben.
 */
public class SimpleFileCopier {

    // Die Hauptmethode, die das Programm startet
    public static void main(String[] args) {
        // Initialisierung der Dateinamen
        String sourceFileName = getRandomFileName();
        String destinationFileName = "kopierteDatei.txt";

        // Aufruf der Methode zum Kopieren der Datei
        copyFile(sourceFileName, destinationFileName);
    }

    // Methode zum Kopieren einer Datei
    public static void copyFile(String sourceFile, String destinationFile) {
        // Deklaration der Variablen für die Dateioperationen
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Initialisierung der Datei-Input-Stream
            fileInputStream = new FileInputStream(new File(sourceFile));
            // Initialisierung der Datei-Output-Stream
            fileOutputStream = new FileOutputStream(new File(destinationFile));

            // Puffer zum Lesen der Datei
            byte[] buffer = new byte[1024];
            int length;

            // Lesen und Schreiben der Datei
            while ((length = fileInputStream.read(buffer)) > 0) {
                fileOutputStream.write(buffer, 0, length);
            }

        } catch (IOException e) {
            // Fehlerbehandlung bei Dateioperationen
            e.printStackTrace();
        } finally {
            // Schließen der Streams
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Methode zum Abrufen eines zufälligen Dateinamens
    public static String getRandomFileName() {
        // Initialisierung des Zufallszahlengenerators
        Random random = new Random();
        // Array mit zufälligen Dateinamen
        String[] files = { "datei1.txt", "datei2.txt", "datei3.txt" };
        // Rückgabe eines zufälligen Dateinamens
        return files[random.nextInt(files.length)];
    }
}

