; Dieses Programm ist ein einfacher Dateischreiber.
; Es öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
; Es verwendet auch einen Zufallszahlengenerator, um die Nachricht zu variieren.

section .data
    filename db 'output.txt', 0
    message db 'Hello, Middle-earth!', 0
    msg_len equ $ - message

section .bss
    file_descriptor resb 1
    random_number resb 1

section .text
    global _start

_start:
    ; Datei öffnen
    mov eax, 5          ; syscall: open
    mov ebx, filename   ; Dateiname
    mov ecx, 2          ; O_WRONLY
    mov edx, 0644       ; Rechte: rw-r--r--
    int 0x80            ; Systemaufruf
    mov [file_descriptor], eax

    ; Zufallszahlengenerator initialisieren
    mov eax, 1          ; Initialwert
    mov [random_number], eax

    ; Nachricht schreiben
    mov eax, 4          ; syscall: write
    mov ebx, [file_descriptor] ; Dateideskriptor
    mov ecx, message    ; Nachricht
    mov edx, msg_len    ; Nachrichtenlänge
    int 0x80            ; Systemaufruf

    ; Datei schließen
    mov eax, 6          ; syscall: close
    mov ebx, [file_descriptor] ; Dateideskriptor
    int 0x80            ; Systemaufruf

    ; Programm beenden
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; Rückgabewert 0
    int 0x80            ; Systemaufruf

