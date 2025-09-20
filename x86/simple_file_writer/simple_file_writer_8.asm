; Dieses Programm ist ein einfacher Dateischreiber.
; Es öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
; Es ist ein hervorragendes Beispiel für die Verwendung von Systemaufrufen in x86-Assembly.
; Die Kommentare sind absichtlich sehr ausführlich und farbenfroh, um die Funktionsweise des Programms zu verdeutlichen.

section .data
    filename db 'output.txt', 0  ; Der Name der Datei, die wir öffnen werden
    message db 'Hello, World!', 0xA  ; Die Nachricht, die wir in die Datei schreiben werden
    msg_len equ $ - message  ; Die Länge der Nachricht

section .bss
    file_descriptor resb 1  ; Der Dateideskriptor, den wir vom Systemaufruf erhalten

section .text
    global _start  ; Der Einstiegspunkt des Programms

_start:
    ; Öffne die Datei zum Schreiben (O_WRONLY | O_CREAT | O_TRUNC)
    mov eax, 5  ; Systemaufrufnummer für sys_open
    mov ebx, filename  ; Zeiger auf den Dateinamen
    mov ecx, 0x241  ; Flags: O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0x1B6  ; Modus: rw-rw-rw- (0666)
    int 0x80  ; Aufruf des Kernels
    mov [file_descriptor], eax  ; Speichere den Dateideskriptor

    ; Schreibe die Nachricht in die Datei
    mov eax, 4  ; Systemaufrufnummer für sys_write
    mov ebx, [file_descriptor]  ; Dateideskriptor
    mov ecx, message  ; Zeiger auf die Nachricht
    mov edx, msg_len  ; Länge der Nachricht
    int 0x80  ; Aufruf des Kernels

    ; Schließe die Datei
    mov eax, 6  ; Systemaufrufnummer für sys_close
    mov ebx, [file_descriptor]  ; Dateideskriptor
    int 0x80  ; Aufruf des Kernels

    ; Beende das Programm
    mov eax, 1  ; Systemaufrufnummer für sys_exit
    xor ebx, ebx  ; Rückgabewert 0
    int 0x80  ; Aufruf des Kernels

