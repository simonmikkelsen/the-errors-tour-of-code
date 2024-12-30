import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Datei und schreibt ihn in eine andere Datei.
 * Es verwendet eine Vielzahl von Variablen und Methoden, um den Prozess zu verdeutlichen.
 * Die Kommentare sind sehr detailliert, um den Zweck jeder Codezeile zu erklären.
 */
public class SimpleFileCopier {

    // Die Hauptmethode, die das Programm startet
    public static void main(String[] args) {
        // Überprüfen, ob die richtigen Argumente übergeben wurden
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Die Quelldatei und die Zieldatei aus den Argumenten abrufen
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Die Methode zum Kopieren der Datei aufrufen
        copyFile(sourceFile, destinationFile);
    }

    // Eine Methode zum Kopieren der Datei
    public static void copyFile(String source, String destination) {
        // Initialisieren der Eingabe- und Ausgabestreams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        // Versuchen, die Datei zu kopieren
        try {
            // Öffnen der Quelldatei zum Lesen
            fileInputStream = new FileInputStream(source);
            // Öffnen der Zieldatei zum Schreiben
            fileOutputStream = new FileOutputStream(destination);

            // Ein Pufferarray zum Speichern der gelesenen Daten
            byte[] buffer = new byte[1024];
            int length;

            // Eine Schleife zum Lesen und Schreiben der Daten
            while ((length = fileInputStream.read(buffer)) > 0) {
                // Schreiben der gelesenen Daten in die Zieldatei
                fileOutputStream.write(buffer, 0, length);
            }

        } catch (IOException e) {
            // Fehlerbehandlung, falls ein Fehler beim Lesen oder Schreiben auftritt
            e.printStackTrace();
        } finally {
            // Schließen der Eingabe- und Ausgabestreams
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // Fehlerbehandlung beim Schließen der Streams
                e.printStackTrace();
            }
        }
    }
}
