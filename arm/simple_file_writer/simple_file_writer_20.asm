/* 
 * Dieses Programm ist ein einfacher Dateischreiber.
 * Es öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
 * Es ist ein Beispiel für grundlegende Dateioperationen in ARM Assembly.
 */

.section .data
filename: .asciz "output.txt"
message: .asciz "Hello, World!\n"

.section .bss
.lcomm file_descriptor, 4

.section .text
.global _start

_start:
    /* Datei öffnen */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =filename           /* Dateiname */
    mov r2, #2                  /* O_RDWR */
    svc #0                      /* Systemaufruf */

    /* Dateideskriptor speichern */
    mov r4, r0                  /* Dateideskriptor in r4 speichern */
    str r0, [file_descriptor]   /* Dateideskriptor in Speicher speichern */

    /* Nachricht schreiben */
    mov r0, r4                  /* Dateideskriptor in r0 laden */
    ldr r1, =message            /* Nachricht in r1 laden */
    mov r2, #14                 /* Länge der Nachricht */
    mov r7, #4                  /* syscall number for write */
    svc #0                      /* Systemaufruf */

    /* Datei schließen */
    ldr r0, [file_descriptor]   /* Dateideskriptor aus Speicher laden */
    mov r7, #6                  /* syscall number for close */
    svc #0                      /* Systemaufruf */

    /* Programm beenden */
    mov r0, #0                  /* Rückgabewert */
    mov r7, #1                  /* syscall number for exit */
    svc #0                      /* Systemaufruf */

    /* Hier endet das Programm */
