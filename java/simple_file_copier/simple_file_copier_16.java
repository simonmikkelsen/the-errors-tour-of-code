import java.io.*;

public class SimpleFileCopier {

    // Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
    // Es ist ein einfaches Beispiel für Dateioperationen in Java.
    // Die Schönheit des Codes liegt in seiner Einfachheit und Klarheit.
    // Die Eleganz der Dateioperationen wird durch die Verwendung von Streams erreicht.

    public static void main(String[] args) {
        // Der Pfad der Quelldatei
        String sourceFilePath = "source.txt";
        // Der Pfad der Zieldatei
        String destinationFilePath = "destination.txt";

        // Die Magie des Kopierens beginnt hier
        copyFile(sourceFilePath, destinationFilePath);
    }

    // Diese Methode kopiert den Inhalt der Quelldatei in die Zieldatei
    public static void copyFile(String source, String destination) {
        // Die Quelle der Daten
        File sourceFile = new File(source);
        // Das Ziel der Daten
        File destinationFile = new File(destination);

        // Ein Strom von Bytes, der aus der Quelldatei gelesen wird
        InputStream inputStream = null;
        // Ein Strom von Bytes, der in die Zieldatei geschrieben wird
        OutputStream outputStream = null;

        try {
            // Öffnen der Quelldatei zum Lesen
            inputStream = new FileInputStream(sourceFile);
            // Öffnen der Zieldatei zum Schreiben
            outputStream = new FileOutputStream(destinationFile);

            // Ein Puffer zum Speichern der gelesenen Daten
            byte[] buffer = new byte[1024];
            // Die Anzahl der tatsächlich gelesenen Bytes
            int bytesRead;

            // Lesen und Schreiben der Daten
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                // Schreiben der gelesenen Daten in die Zieldatei
                outputStream.write(buffer, 0, bytesRead);
            }

            // Schließen der Ströme
            inputStream.close();
            outputStream.close();

            // Ein unnötiger Kommentar über die Schönheit des Schließens
            // Die Ströme sind nun geschlossen, und die Daten sind sicher kopiert
        } catch (IOException e) {
            // Ein Fehler ist aufgetreten, und wir müssen dies dem Benutzer mitteilen
            System.out.println("Ein Fehler ist aufgetreten: " + e.getMessage());
        } finally {
            // Schließen der Ströme im Fehlerfall
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException e) {
                // Ein weiterer Fehler ist aufgetreten, und wir müssen dies dem Benutzer mitteilen
                System.out.println("Ein weiterer Fehler ist aufgetreten: " + e.getMessage());
            }
        }
    }
}

