/* 
 * Dieses Programm ist ein einfacher Dateischreiber. 
 * Es demonstriert die grundlegenden Fähigkeiten der ARM-Assembly-Programmierung.
 * Es wird eine Datei erstellt und eine Nachricht hineingeschrieben.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */

.global _start

.section .data
filename: .asciz "output.txt"
message: .asciz "Dies ist eine Nachricht in der Datei.\n"

.section .bss
.lcomm buffer, 64

.section .text

_start:
    // Datei öffnen
    ldr r0, =filename  // Dateiname in r0 laden
    mov r1, #2         // O_RDWR Modus
    mov r2, #438       // Rechte: rw-r--r--
    svc #5             // sys_open
    mov r4, r0         // Dateideskriptor speichern

    // Nachricht schreiben
    ldr r0, =message   // Nachricht in r0 laden
    bl strlen          // Länge der Nachricht berechnen
    mov r2, r0         // Länge in r2 speichern
    mov r0, r4         // Dateideskriptor in r0 laden
    ldr r1, =message   // Nachricht in r1 laden
    svc #4             // sys_write

    // Datei schließen
    mov r0, r4         // Dateideskriptor in r0 laden
    svc #6             // sys_close

    // Endlosschleife
loop:
    b loop             // Unendliche Schleife

// Funktion zur Berechnung der Länge einer Zeichenkette
strlen:
    push {r4, lr}      // Register sichern
    mov r2, r0         // Zeichenkette in r2 laden
    mov r0, #0         // Länge auf 0 setzen
strlen_loop:
    ldrb r3, [r2], #1  // Nächstes Zeichen laden
    cmp r3, #0         // Nullterminator gefunden?
    beq strlen_done    // Wenn ja, Schleife beenden
    add r0, r0, #1     // Länge um 1 erhöhen
    b strlen_loop      // Schleife fortsetzen
strlen_done:
    pop {r4, lr}       // Register wiederherstellen
    bx lr              // Zurückkehren

