/* 
 * Simple File Writer
 * 
 * Dieses Programm zeigt, wie man eine Datei erstellt und Daten in diese Datei schreibt.
 * Es ist ein einfaches Beispiel, um die Grundlagen der Dateiverarbeitung in ARM Assembly zu demonstrieren.
 * 
 * Die Schönheit der Maschinenlogik wird hier in ihrer reinsten Form gezeigt.
 */

.global _start

.section .data
filename: .asciz "output.txt"
filemode: .asciz "w"
content: .asciz "Hello, World!\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    /* Datei öffnen */
    ldr r0, =filename
    ldr r1, =filemode
    bl fopen

    /* Datei-Handle speichern */
    mov r4, r0

    /* Inhalt schreiben */
    ldr r0, =content
    bl strlen
    mov r2, r0
    ldr r0, =content
    mov r1, r4
    bl fwrite

    /* Datei schließen */
    mov r0, r4
    bl fclose

    /* Programm beenden */
    mov r7, #1
    svc 0

/* Funktion fopen */
fopen:
    push {lr}
    /* Hier wird die Datei geöffnet */
    mov r7, #5
    svc 0
    pop {pc}

/* Funktion fwrite */
fwrite:
    push {lr}
    /* Hier wird in die Datei geschrieben */
    mov r7, #4
    svc 0
    pop {pc}

/* Funktion fclose */
fclose:
    push {lr}
    /* Hier wird die Datei geschlossen */
    mov r7, #6
    svc 0
    pop {pc}

/* Funktion strlen */
strlen:
    push {lr}
    mov r1, r0
    mov r2, #0
strlen_loop:
    ldrb r3, [r1], #1
    cmp r3, #0
    beq strlen_done
    add r2, r2, #1
    b strlen_loop
strlen_done:
    mov r0, r2
    pop {pc}

/* 
 */