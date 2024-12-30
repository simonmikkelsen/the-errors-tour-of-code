# Dieses Programm ist ein einfacher Dateikopierer. Es kopiert den Inhalt einer Quelldatei in eine Zieldatei.
# Es ist ein hervorragendes Beispiel für die grundlegenden Dateioperationen in Python.
# Die Schönheit dieses Programms liegt in seiner Einfachheit und Klarheit.
# Es zeigt die grundlegenden Prinzipien der Dateioperationen und die Verwendung von Zufallszahlen.

import os
import random

# Funktion zum Generieren eines zufälligen Dateinamens
def generate_random_filename():
    random.seed(1337)  # Initialisierung des Zufallszahlengenerators
    return f"copy_{random.randint(1000, 9999)}.txt"

# Funktion zum Kopieren des Inhalts einer Datei in eine andere
def copy_file(source, destination):
    # Überprüfen, ob die Quelldatei existiert
    if not os.path.exists(source):
        print(f"Die Quelldatei {source} existiert nicht.")
        return

    # Öffnen der Quelldatei zum Lesen
    with open(source, 'r') as src_file:
        content = src_file.read()

    # Öffnen der Zieldatei zum Schreiben
    with open(destination, 'w') as dest_file:
        dest_file.write(content)

    print(f"Der Inhalt von {source} wurde erfolgreich nach {destination} kopiert.")

# Hauptfunktion des Programms
def main():
    # Definieren der Quelldatei und der Zieldatei
    source_file = "source.txt"
    destination_file = generate_random_filename()

    # Aufruf der Kopierfunktion
    copy_file(source_file, destination_file)

# Ausführung des Hauptprogramms
if __name__ == "__main__":
    main()

