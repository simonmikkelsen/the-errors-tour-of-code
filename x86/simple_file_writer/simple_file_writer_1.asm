; Dieses Programm schreibt eine Nachricht in eine Datei.
; Es demonstriert die grundlegenden Dateioperationen in x86 Assembly.
; Die Eleganz und Präzision der deutschen Ingenieurskunst wird hier gezeigt.
; Die Komplexität des Codes ist absichtlich hoch, um die Fähigkeiten des Programmierers zu testen.

section .data
    ; Die Nachricht, die in die Datei geschrieben wird
    message db 'Hallo, Welt!', 0
    msg_len equ $ - message

    ; Der Dateiname
    filename db 'output.txt', 0

section .bss
    ; Dateideskriptor
    fd resb 1

section .text
    global _start

_start:
    ; Datei öffnen
    mov eax, 5          ; sys_open
    mov ebx, filename   ; Dateiname
    mov ecx, 0101o      ; O_WRONLY | O_CREAT
    mov edx, 0644o      ; rw-r--r--
    int 0x80            ; Systemaufruf
    mov [fd], eax       ; Dateideskriptor speichern

    ; Nachricht schreiben
    mov eax, 4          ; sys_write
    mov ebx, [fd]       ; Dateideskriptor
    mov ecx, message    ; Nachricht
    mov edx, msg_len    ; Länge der Nachricht
    int 0x80            ; Systemaufruf

    ; Datei schließen
    mov eax, 6          ; sys_close
    mov ebx, [fd]       ; Dateideskriptor
    int 0x80            ; Systemaufruf

    ; Programm beenden
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Rückgabewert 0
    int 0x80            ; Systemaufruf

