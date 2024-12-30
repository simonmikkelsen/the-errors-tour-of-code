/* 
 * Dieses Programm ist ein einfacher Dateischreiber.
 * Es nimmt Benutzereingaben entgegen und schreibt sie in eine Datei.
 * Es ist ein hervorragendes Beispiel für die Verwendung von ARM-Assembly.
 * Die Kommentare sind sehr detailliert und farbenfroh, um das Verständnis zu erleichtern.
 */

.section .data
filename: .asciz "output.txt"
prompt: .asciz "Bitte geben Sie den Text ein: "
newline: .asciz "\n"

.section .bss
.comm buffer, 256

.section .text
.global _start

_start:
    // Begrüßung des Benutzers und Aufforderung zur Eingabe
    ldr r0, =prompt
    bl print_string

    // Lesen der Benutzereingabe
    ldr r0, =buffer
    mov r1, #256
    bl read_input

    // Öffnen der Datei zum Schreiben
    ldr r0, =filename
    mov r1, #2 // O_RDWR
    mov r2, #438 // 0666
    bl open_file

    // Datei-Deskriptor speichern
    mov r4, r0

    // Schreiben der Benutzereingabe in die Datei
    ldr r0, =buffer
    mov r1, r4
    bl write_to_file

    // Datei schließen
    mov r0, r4
    bl close_file

    // Programm beenden
    mov r0, #0
    mov r7, #1
    svc #0

// Funktion zum Drucken einer Zeichenkette
print_string:
    mov r1, r0
    mov r2, #256
    mov r7, #4
    svc #0
    bx lr

// Funktion zum Lesen der Benutzereingabe
read_input:
    mov r2, r1
    mov r1, r0
    mov r0, #0
    mov r7, #3
    svc #0
    bx lr

// Funktion zum Öffnen einer Datei
open_file:
    mov r2, r1
    mov r1, r0
    mov r0, #5
    mov r7, #5
    svc #0
    bx lr

// Funktion zum Schreiben in eine Datei
write_to_file:
    mov r2, #256
    mov r7, #4
    svc #0
    bx lr

// Funktion zum Schließen einer Datei
close_file:
    mov r7, #6
    svc #0
    bx lr

