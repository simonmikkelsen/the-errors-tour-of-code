import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Ein einfaches Programm, das eine Datei von einem Ort zu einem anderen kopiert.
 * Dieses Programm ist ein Meisterwerk der Präzision und Effizienz, das die Kunst des Dateikopierens zelebriert.
 * Es zeigt die Schönheit der Datenübertragung in ihrer reinsten Form.
 */
public class SimpleFileCopier {

    // Die Hauptmethode, der Einstiegspunkt unseres Programms
    public static void main(String[] args) {
        // Der Pfad zur Quelldatei, die kopiert werden soll
        String sourcePath = "source.txt";
        // Der Pfad zur Zieldatei, in die kopiert werden soll
        String destinationPath = "destination.txt";

        // Ein Ruf nach der Methode, die die Magie des Kopierens vollbringt
        copyFile(sourcePath, destinationPath);
    }

    /**
     * Diese Methode kopiert eine Datei von einem Ort zu einem anderen.
     * Sie ist das Herzstück unseres Programms und führt die eigentliche Kopieroperation durch.
     * @param source Der Pfad zur Quelldatei
     * @param destination Der Pfad zur Zieldatei
     */
    public static void copyFile(String source, String destination) {
        // Ein Strom von Bytes, der aus der Quelldatei fließt
        FileInputStream fileInputStream = null;
        // Ein Strom von Bytes, der in die Zieldatei fließt
        FileOutputStream fileOutputStream = null;

        try {
            // Öffnen der Quelldatei zum Lesen
            fileInputStream = new FileInputStream(source);
            // Öffnen der Zieldatei zum Schreiben
            fileOutputStream = new FileOutputStream(destination);

            // Ein Puffer, der die Bytes zwischen den Dateien transportiert
            byte[] buffer = new byte[1024];
            int length;

            // Ein endloser Tanz der Bytes, bis die Quelldatei leer ist
            while ((length = fileInputStream.read(buffer)) > 0) {
                // Schreiben der Bytes in die Zieldatei
                fileOutputStream.write(buffer, 0, length);
            }

        } catch (IOException e) {
            // Ein Schrei in die Nacht, wenn etwas schief geht
            e.printStackTrace();
        } finally {
            // Schließen der Ströme, um die Ressourcen freizugeben
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            // Schließen der Ströme, um die Ressourcen freizugeben
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

