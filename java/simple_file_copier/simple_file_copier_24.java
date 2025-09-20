import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm zum Kopieren von Dateien.
 * Dieses Programm liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es demonstriert die grundlegende Verwendung von FileInputStream und FileOutputStream.
 * Die Datei wird Byte für Byte kopiert, um die Genauigkeit zu gewährleisten.
 * Es gibt viele Variablen und Funktionen, um die Lesbarkeit zu verbessern.
 */
public class SimpleFileCopier {

    public static void main(String[] args) {
        // Die Quelle und das Ziel der Datei
        String sourceFile = "source.txt";
        String destinationFile = "destination.txt";

        // Initialisierung der Streams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Öffnen der Quelldatei zum Lesen
            fileInputStream = new FileInputStream(sourceFile);
            // Öffnen der Zieldatei zum Schreiben
            fileOutputStream = new FileOutputStream(destinationFile);

            // Puffer zum Speichern der gelesenen Bytes
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Lesen und Schreiben der Datei
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Schließen der Streams
            fileInputStream.close();
            fileOutputStream.close();

        } catch (IOException e) {
            // Fehlerbehandlung
            e.printStackTrace();
        } finally {
            // Sicherstellen, dass die Streams geschlossen werden
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

