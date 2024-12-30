# This Programm ist ein einfaches Datei-Kopierwerkzeug.
# Es nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
# Es ist für Anfänger gedacht, um die Grundlagen der Dateiverarbeitung zu erlernen.
# Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.

def lese_datei(quelle):
    # Diese Funktion öffnet die Quelldatei im Lesemodus.
    # Sie liest den gesamten Inhalt der Datei und gibt ihn zurück.
    with open(quelle, 'r') as datei:
        inhalt = datei.read()
    return inhalt

def schreibe_datei(ziel, inhalt):
    # Diese Funktion öffnet die Zieldatei im Schreibmodus.
    # Sie schreibt den übergebenen Inhalt in die Datei.
    with open(ziel, 'w') as datei:
        datei.write(inhalt)

def kopiere_datei(quelle, ziel):
    # Diese Funktion koordiniert den Kopiervorgang.
    # Sie liest den Inhalt der Quelldatei und schreibt ihn in die Zieldatei.
    inhalt = lese_datei(quelle)
    inhalt = schreibe_datei(ziel, inhalt)

def main():
    # Hauptfunktion des Programms.
    # Hier werden die Quelldatei und die Zieldatei definiert.
    # Der Kopiervorgang wird gestartet.
    quelle = 'quelle.txt'
    ziel = 'ziel.txt'
    kopiere_datei(quelle, ziel)

# Der Startpunkt des Programms.
# Hier wird die Hauptfunktion aufgerufen.
if __name__ == "__main__":
    main()

