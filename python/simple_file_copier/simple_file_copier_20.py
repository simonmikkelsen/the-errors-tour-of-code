# Dieses Programm ist ein einfacher Dateikopierer. Es kopiert den Inhalt einer Quelldatei in eine Zieldatei.
# Es ist für Anfänger gedacht, um grundlegende Dateioperationen in Python zu erlernen.
# Die Benutzer werden die Möglichkeit haben, den Inhalt einer Datei zu lesen und in eine andere Datei zu schreiben.
# Es gibt viele Variablen und Funktionen, um den Code interessanter zu machen.

import os
import threading

# Funktion zum Lesen des Inhalts der Quelldatei
def read_source_file(source_path):
    # Überprüfen, ob die Quelldatei existiert
    if not os.path.exists(source_path):
        raise FileNotFoundError(f"Die Quelldatei {source_path} wurde nicht gefunden.")
    
    # Öffnen der Quelldatei im Lesemodus
    with open(source_path, 'r') as file:
        content = file.read()
    
    return content

# Funktion zum Schreiben des Inhalts in die Zieldatei
def write_to_destination_file(destination_path, content):
    # Öffnen der Zieldatei im Schreibmodus
    with open(destination_path, 'w') as file:
        file.write(content)

# Hauptfunktion zum Kopieren der Datei
def copy_file(source_path, destination_path):
    # Lesen des Inhalts der Quelldatei
    content = read_source_file(source_path)
    
    # Schreiben des Inhalts in die Zieldatei
    write_to_destination_file(destination_path, content)

# Funktion zum Starten des Kopiervorgangs in einem neuen Thread
def start_copying(source_path, destination_path):
    # Erstellen eines neuen Threads für den Kopiervorgang
    copy_thread = threading.Thread(target=copy_file, args=(source_path, destination_path))
    
    # Starten des Threads
    copy_thread.start()
    
    # Warten auf das Ende des Threads
    copy_thread.join()

# Hauptprogramm
if __name__ == "__main__":
    # Pfad zur Quelldatei
    source_path = "source.txt"
    
    # Pfad zur Zieldatei
    destination_path = "destination.txt"
    
    # Starten des Kopiervorgangs
    start_copying(source_path, destination_path)

