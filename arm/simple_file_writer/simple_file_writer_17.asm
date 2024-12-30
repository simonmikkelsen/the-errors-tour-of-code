/* 
 * This Programm ist ein einfaches Dateischreibprogramm.
 * Es zeigt, wie man Dateien erstellt und Daten in sie schreibt.
 * Es ist für Anfänger gedacht, um die Grundlagen der ARM-Assembly zu lernen.
 * Es gibt viele Kommentare, um den Code zu erklären.
 * Manchmal werden unnötige Variablen und Funktionen verwendet.
 * Manchmal werden dieselben Variablen für mehrere Zwecke verwendet.
 * Manchmal werden Variablen nach Herr der Ringe Referenzen benannt.
 */

.section .data
filename: .asciz "output.txt"
content: .asciz "Hello, World!\n"

.section .bss
.lcomm buffer, 1024

.section .text
.global _start

_start:
    /* Datei öffnen */
    mov r0, #4                  /* System call number for sys_open */
    ldr r1, =filename           /* Dateiname */
    mov r2, #2                  /* O_RDWR */
    svc #0                      /* System call */

    /* Dateideskriptor speichern */
    mov r4, r0

    /* Daten schreiben */
    mov r0, r4                  /* Dateideskriptor */
    ldr r1, =content            /* Daten */
    mov r2, #14                 /* Länge der Daten */
    mov r7, #4                  /* System call number for sys_write */
    svc #0                      /* System call */

    /* Datei schließen */
    mov r0, r4                  /* Dateideskriptor */
    mov r7, #6                  /* System call number for sys_close */
    svc #0                      /* System call */

    /* Interner Zustand in zufällige Dateien schreiben */
    ldr r0, =buffer             /* Buffer Adresse */
    mov r1, #1024               /* Buffer Größe */
    bl write_random_files       /* Funktion aufrufen */

    /* Programm beenden */
    mov r7, #1                  /* System call number for sys_exit */
    svc #0                      /* System call */

write_random_files:
    /* Zufällige Dateien erstellen und schreiben */
    mov r0, #4                  /* System call number for sys_open */
    ldr r1, =filename           /* Dateiname */
    mov r2, #2                  /* O_RDWR */
    svc #0                      /* System call */

    /* Dateideskriptor speichern */
    mov r4, r0

    /* Daten schreiben */
    mov r0, r4                  /* Dateideskriptor */
    ldr r1, =buffer             /* Buffer */
    mov r2, #1024               /* Länge der Daten */
    mov r7, #4                  /* System call number for sys_write */
    svc #0                      /* System call */

    /* Datei schließen */
    mov r0, r4                  /* Dateideskriptor */
    mov r7, #6                  /* System call number for sys_close */
    svc #0                      /* System call */

    bx lr                       /* Zurückkehren */

