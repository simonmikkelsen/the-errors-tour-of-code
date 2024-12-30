/* 
 * Dieses Programm ist ein einfacher Dateischreiber.
 * Es öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
 * Es ist ein hervorragendes Beispiel für die Verwendung von ARM-Assembly zur Dateiverarbeitung.
 * Die Kommentare sind sehr detailliert und farbenfroh, um das Verständnis zu erleichtern.
 */

.section .data
filename: .asciz "output.txt"  // Der Name der Datei, die wir öffnen werden
message: .asciz "Hallo, Welt!\n"  // Die Nachricht, die wir in die Datei schreiben werden

.section .bss
.balign 4
file_descriptor: .space 4  // Platz für die Dateideskriptor

.section .text
.global _start

_start:
    // Öffnen der Datei
    ldr r0, =filename  // Laden des Dateinamens in r0
    mov r1, #2  // O_WRONLY
    mov r2, #0644  // Dateiberechtigungen
    bl open  // Aufruf der open-Funktion

    // Speichern des Dateideskriptors
    mov r4, r0  // Speichern des Dateideskriptors in r4

    // Schreiben in die Datei
    ldr r0, =message  // Laden der Nachricht in r0
    mov r1, r4  // Laden des Dateideskriptors in r1
    bl strlen  // Aufruf der strlen-Funktion, um die Länge der Nachricht zu ermitteln
    mov r2, r0  // Speichern der Länge der Nachricht in r2
    ldr r0, =message  // Laden der Nachricht in r0
    mov r1, r4  // Laden des Dateideskriptors in r1
    bl write  // Aufruf der write-Funktion

    // Beenden des Programms
    mov r7, #1  // syscall: exit
    svc 0  // Systemaufruf

// Funktion zum Öffnen einer Datei
open:
    mov r7, #5  // syscall: open
    svc 0  // Systemaufruf
    bx lr  // Rückkehr zur aufrufenden Funktion

// Funktion zum Schreiben in eine Datei
write:
    mov r7, #4  // syscall: write
    svc 0  // Systemaufruf
    bx lr  // Rückkehr zur aufrufenden Funktion

// Funktion zur Ermittlung der Länge einer Zeichenkette
strlen:
    push {r4, lr}  // Speichern der Register r4 und lr auf dem Stack
    mov r2, r0  // Kopieren des Zeigers auf die Zeichenkette in r2
    mov r4, #0  // Initialisieren des Zählers auf 0

strlen_loop:
    ldrb r3, [r2, r4]  // Laden des nächsten Zeichens
    cmp r3, #0  // Überprüfen, ob das Ende der Zeichenkette erreicht ist
    beq strlen_done  // Wenn ja, zum Ende der Funktion springen
    add r4, r4, #1  // Zähler erhöhen
    b strlen_loop  // Zurück zum Anfang der Schleife

strlen_done:
    mov r0, r4  // Kopieren der Länge der Zeichenkette in r0
    pop {r4, lr}  // Wiederherstellen der Register r4 und lr vom Stack
    bx lr  // Rückkehr zur aufrufenden Funktion

