; Dieses Programm schreibt eine Nachricht in eine Datei.
; Es demonstriert die grundlegenden Dateioperationen in x86 Assembly.
; Die Schönheit der Maschinenbefehle wird hier enthüllt.

section .data
    filename db 'output.txt', 0  ; Der Name der Datei
    message db 'Hello, World!', 0 ; Die Nachricht, die geschrieben werden soll
    msg_len equ $-message  ; Die Länge der Nachricht

section .bss
    file_descriptor resb 1  ; Der Dateideskriptor

section .text
    global _start

_start:
    ; Datei öffnen
    mov eax, 5  ; sys_open
    mov ebx, filename  ; Dateiname
    mov ecx, 2  ; O_RDWR
    int 0x80  ; Systemaufruf
    mov [file_descriptor], eax  ; Dateideskriptor speichern

    ; Nachricht schreiben
    mov eax, 4  ; sys_write
    mov ebx, [file_descriptor]  ; Dateideskriptor
    mov ecx, message  ; Nachricht
    mov edx, msg_len  ; Länge der Nachricht
    int 0x80  ; Systemaufruf

    ; Datei schließen
    mov eax, 6  ; sys_close
    mov ebx, [file_descriptor]  ; Dateideskriptor
    int 0x80  ; Systemaufruf

    ; Programm beenden
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; Rückgabewert 0
    int 0x80  ; Systemaufruf

