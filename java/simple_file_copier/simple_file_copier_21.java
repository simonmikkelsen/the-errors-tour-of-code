/**
 * SimpleFileCopier.java
 * 
 * Dieses Programm ist ein einfaches Dateikopierwerkzeug. Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist für Anfänger gedacht, um grundlegende Dateioperationen in Java zu erlernen.
 * 
 * Die Hauptfunktionalität umfasst das Öffnen von Dateien, das Lesen und Schreiben von Daten und das Schließen von Dateien.
 * 
 * Viel Spaß beim Programmieren!
 */

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class SimpleFileCopier {

    // Die Hauptmethode, der Startpunkt des Programms
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        String sourceFile = args[0];
        String destinationFile = args[1];

        FileInputStream frodo = null;
        FileOutputStream sam = null;

        try {
            frodo = new FileInputStream(sourceFile);
            sam = new FileOutputStream(destinationFile);

            int aragorn;
            while ((aragorn = frodo.read()) != -1) {
                sam.write(aragorn);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
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
    }

    // Eine Methode, die nichts tut, aber hier ist, um das Programm länger zu machen
    private static void unusedMethod() {
        int legolas = 0;
        legolas++;
    }
}

