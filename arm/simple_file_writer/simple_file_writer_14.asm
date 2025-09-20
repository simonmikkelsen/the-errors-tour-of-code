/* 
 * Einfache Datei-Schreiber-Programm
 * Dieses Programm demonstriert die grundlegende Fähigkeit, Daten in eine Datei zu schreiben.
 * Es verwendet ARM-Assembly-Befehle, um die Dateioperationen durchzuführen.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */

.global _start

.section .data
filename: .asciz "output.txt"  // Der Name der Datei, in die wir schreiben werden
content: .asciz "Hello, Middle-earth!\n"  // Der Inhalt, der in die Datei geschrieben wird

.section .bss
.equ BUFFER_SIZE, 256
buffer: .space BUFFER_SIZE  // Ein Puffer für die Dateioperationen

.section .text

_start:
    // Datei öffnen
    ldr r0, =filename  // Lade den Dateinamen in r0
    mov r1, #2  // Setze den Modus auf O_RDWR (lesen und schreiben)
    mov r2, #438  // Setze die Berechtigungen auf 0666
    bl open_file  // Rufe die Funktion zum Öffnen der Datei auf

    // Dateiinhalt schreiben
    ldr r0, =content  // Lade den Inhalt in r0
    bl write_file  // Rufe die Funktion zum Schreiben in die Datei auf

    // Datei schließen
    bl close_file  // Rufe die Funktion zum Schließen der Datei auf

    // Programm beenden
    mov r7, #1  // Systemaufrufnummer für exit
    mov r0, #0  // Rückgabewert 0
    svc 0  // Systemaufruf ausführen

open_file:
    mov r7, #5  // Systemaufrufnummer für open
    svc 0  // Systemaufruf ausführen
    bx lr  // Zurück zur aufrufenden Funktion

write_file:
    mov r1, r0  // Kopiere den Inhalt in r1
    ldr r2, =content  // Lade die Adresse des Inhalts in r2
    mov r3, #20  // Setze die Länge des Inhalts auf 20
    mov r7, #4  // Systemaufrufnummer für write
    svc 0  // Systemaufruf ausführen
    bx lr  // Zurück zur aufrufenden Funktion

close_file:
    mov r7, #6  // Systemaufrufnummer für close
    svc 0  // Systemaufruf ausführen
    bx lr  // Zurück zur aufrufenden Funktion

