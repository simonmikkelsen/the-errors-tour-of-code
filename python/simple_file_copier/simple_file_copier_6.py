# Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
# Es ist ein hervorragendes Beispiel für die grundlegende Dateiverarbeitung in Python.
# Die Benutzer werden die Schönheit und Eleganz der Python-Syntax erleben.
# Die Variablen und Funktionen sind sorgfältig ausgewählt, um die Klarheit und Lesbarkeit des Codes zu maximieren.

def read_file(source):
    # Diese Funktion liest den Inhalt der Quelldatei und gibt ihn als String zurück.
    # Es ist eine einfache, aber effektive Methode, um den gesamten Inhalt einer Datei zu lesen.
    with open(source, 'r') as file:
        content = file.read()
    return content

def write_file(destination, content):
    # Diese Funktion schreibt den gegebenen Inhalt in die Zieldatei.
    # Es ist eine grundlegende Methode, um Daten in eine Datei zu schreiben.
    with open(destination, 'w') as file:
        file.write(content)

def copy_file(source, destination):
    # Diese Funktion kombiniert die Lese- und Schreibfunktionen, um eine Datei zu kopieren.
    # Es ist eine elegante Lösung für das Problem des Dateikopierens.
    content = read_file(source)
    write_file(destination, content)

def main():
    # Der Hauptteil des Programms, der die Ausführung steuert.
    # Hier werden die Quelldatei und die Zieldatei definiert und die Kopierfunktion aufgerufen.
    source = "source.txt"
    destination = "destination.txt"
    copy_file(source, destination)

# Der Startpunkt des Programms. Hier wird die Hauptfunktion aufgerufen.
if __name__ == "__main__":
    main()

