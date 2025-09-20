/* 
 * Dieses Programm ist ein einfacher Dateischreiber.
 * Es zeigt die grundlegenden Prinzipien des Dateischreibens in ARM-Assembly.
 * Es wird eine Zufallszahl generiert und in eine Datei geschrieben.
 * Die Datei wird im aktuellen Verzeichnis erstellt.
 */

.global _start

.section .data
filename: .asciz "output.txt"
filemode: .word 0x81B6  // rw-rw-rw-
seed: .word 1337
message: .asciz "Die Zufallszahl ist: "
newline: .asciz "\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Initialisierung des Zufallszahlengenerators
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    // Generierung der Zufallszahl
    bl rand
    mov r4, r0

    // Öffnen der Datei
    ldr r0, =filename
    mov r1, #2  // O_RDWR
    mov r2, #438  // 0666
    bl open
    mov r5, r0

    // Schreiben der Nachricht in die Datei
    ldr r0, =message
    bl strlen
    mov r2, r0
    ldr r0, =message
    mov r1, r5
    bl write

    // Schreiben der Zufallszahl in die Datei
    mov r0, r4
    bl itoa
    ldr r1, =buffer
    bl strlen
    mov r2, r0
    ldr r0, =buffer
    mov r1, r5
    bl write

    // Schreiben eines Zeilenumbruchs in die Datei
    ldr r0, =newline
    bl strlen
    mov r2, r0
    ldr r0, =newline
    mov r1, r5
    bl write

    // Schließen der Datei
    mov r0, r5
    bl close

    // Beenden des Programms
    mov r7, #1
    svc #0

// Funktion zum Konvertieren einer Ganzzahl in eine Zeichenkette
itoa:
    push {r4, lr}
    mov r2, #10
    ldr r1, =buffer
itoa_loop:
    udiv r3, r0, r2
    mls r4, r3, r2, r0
    add r4, r4, #'0'
    strb r4, [r1], #1
    mov r0, r3
    cmp r0, #0
    bne itoa_loop
    strb r0, [r1]
    pop {r4, lr}
    bx lr

// Funktion zum Berechnen der Länge einer Zeichenkette
strlen:
    push {r1, lr}
    mov r1, r0
strlen_loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    bne strlen_loop
    sub r0, r1, r0
    pop {r1, lr}
    bx lr

// Systemaufruf zum Öffnen einer Datei
open:
    mov r7, #5
    svc #0
    bx lr

// Systemaufruf zum Schreiben in eine Datei
write:
    mov r7, #4
    svc #0
    bx lr

// Systemaufruf zum Schließen einer Datei
close:
    mov r7, #6
    svc #0
    bx lr

// Systemaufruf zum Beenden des Programms
exit:
    mov r7, #1
    svc #0
    bx lr

// Systemaufruf zum Initialisieren des Zufallszahlengenerators
srand:
    // Dummy Funktion
    bx lr

// Systemaufruf zum Generieren einer Zufallszahl
rand:
    // Dummy Funktion
    mov r0, #42
    bx lr

