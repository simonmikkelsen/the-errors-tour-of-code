; Dieses Programm ist ein einfacher Dateischreiber.
; Es öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
; Es ist ein Beispiel für grundlegende Dateioperationen in x86 Assembly.
; Die Kommentare sind sehr detailliert, um den Zweck jeder Anweisung zu erklären.

section .data
    ; Die Nachricht, die in die Datei geschrieben werden soll
    message db 'Hallo, Welt!', 0
    msg_len equ $ - message

    ; Der Dateiname
    filename db 'output.txt', 0

section .bss
    ; Dateideskriptor
    fd resb 4

section .text
    global _start

_start:
    ; Datei öffnen
    ; Der Dateiname wird in den EAX-Register geladen
    mov eax, 5          ; sys_open
    mov ebx, filename   ; Dateiname
    mov ecx, 2          ; O_RDWR
    mov edx, 438        ; 0666 in oktal
    int 0x80            ; Systemaufruf

    ; Dateideskriptor speichern
    mov [fd], eax

    ; Nachricht schreiben
    ; Der Dateideskriptor wird in den EBX-Register geladen
    mov eax, 4          ; sys_write
    mov ebx, [fd]       ; Dateideskriptor
    mov ecx, message    ; Nachricht
    mov edx, msg_len    ; Länge der Nachricht
    int 0x80            ; Systemaufruf

    ; Programm beenden
    ; Der Rückgabewert wird in den EAX-Register geladen
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Rückgabewert 0
    int 0x80            ; Systemaufruf

