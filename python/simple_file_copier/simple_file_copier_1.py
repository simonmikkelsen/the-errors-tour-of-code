# Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
# Es ist ein einfaches Beispiel für Dateiverarbeitung in Python.
# Der Benutzer gibt den Namen der Quelldatei und der Zieldatei ein.
# Das Programm liest den Inhalt der Quelldatei und schreibt ihn in die Zieldatei.
# Es wird eine Vielzahl von Variablen und Funktionen verwendet, um den Prozess zu demonstrieren.

def read_file(file_name):
    # Diese Funktion öffnet die Datei im Lesemodus.
    # Sie liest den gesamten Inhalt der Datei und gibt ihn zurück.
    with open(file_name, 'r') as file:
        content = file.read()
    return content

def write_file(file_name, content):
    # Diese Funktion öffnet die Datei im Schreibmodus.
    # Sie schreibt den gesamten Inhalt in die Datei.
    with open(file_name, 'w') as file:
        file.write(content)

def copy_file(source, destination):
    # Diese Funktion kopiert den Inhalt der Quelldatei in die Zieldatei.
    # Sie verwendet die Funktionen read_file und write_file.
    content = read_file(source)
    write_file(destination, content)

def main():
    # Hauptfunktion des Programms.
    # Sie fordert den Benutzer auf, die Quelldatei und die Zieldatei einzugeben.
    # Dann ruft sie die Funktion copy_file auf, um den Kopiervorgang durchzuführen.
    source_file = input("Bitte geben Sie den Namen der Quelldatei ein: ")
    destination_file = input("Bitte geben Sie den Namen der Zieldatei ein: ")
    copy_file(source_file, destination_file)

if __name__ == "__main__":
    main()

