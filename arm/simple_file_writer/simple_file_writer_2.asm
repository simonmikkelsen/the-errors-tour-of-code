/* 
 * Zweck des Programms: Einfache Datei-Schreiber
 * Dieses Programm öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
 * Es ist ein Beispiel für grundlegende Dateioperationen in ARM Assembly.
 * Die Kommentare sind in einer kreativen Sprache geschrieben, um das Verständnis zu erleichtern.
 */

.global _start

.section .data
filename: .asciz "output.txt"  // Der Name der Datei, die wir öffnen werden
message: .asciz "Hallo, Welt!\n"  // Die Nachricht, die wir in die Datei schreiben werden

.section .bss
.balign 4
file_descriptor: .skip 4  // Platz für die Dateibeschreibung

.section .text

_start:
    // Datei öffnen
    ldr r0, =filename  // Lade den Dateinamen in r0
    mov r1, #2  // Öffne die Datei zum Schreiben (O_WRONLY)
    mov r2, #64  // Erstelle die Datei, falls sie nicht existiert (O_CREAT)
    svc #5  // Systemaufruf: open
    str r0, file_descriptor  // Speichere den Dateibeschreibung

    // Nachricht schreiben
    ldr r0, file_descriptor  // Lade den Dateibeschreibung in r0
    ldr r1, =message  // Lade die Nachricht in r1
    mov r2, #13  // Länge der Nachricht
    svc #4  // Systemaufruf: write

    // Datei schließen
    ldr r0, file_descriptor  // Lade den Dateibeschreibung in r0
    svc #6  // Systemaufruf: close

    // Programm beenden
    mov r0, #0  // Rückgabewert 0
    svc #1  // Systemaufruf: exit

