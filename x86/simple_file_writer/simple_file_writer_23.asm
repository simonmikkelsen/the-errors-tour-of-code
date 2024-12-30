; Dieses Programm ist ein einfaches Dateischreibprogramm.
; Es öffnet eine Datei, schreibt eine Nachricht hinein und schließt die Datei.
; Es ist ein hervorragendes Beispiel für die Verwendung von Systemaufrufen in x86-Assembly.
; Die Kommentare sind sehr detailliert, um das Verständnis zu erleichtern.

section .data
    filename db 'output.txt', 0  ; Der Name der Datei, die erstellt wird
    message db 'Hello, World!', 0xA  ; Die Nachricht, die in die Datei geschrieben wird
    msg_len equ $ - message  ; Die Länge der Nachricht

section .bss
    file_descriptor resb 1  ; Der Dateideskriptor

section .text
    global _start

_start:
    ; Datei öffnen
    mov eax, 5  ; Systemaufrufnummer für sys_open
    mov ebx, filename  ; Zeiger auf den Dateinamen
    mov ecx, 2  ; O_WRONLY
    mov edx, 0x1C0  ; 0700 in oktal (Eigentümer hat Lese-, Schreib- und Ausführungsrechte)
    int 0x80  ; Systemaufruf ausführen
    mov [file_descriptor], eax  ; Dateideskriptor speichern

    ; Nachricht schreiben
    mov eax, 4  ; Systemaufrufnummer für sys_write
    mov ebx, [file_descriptor]  ; Dateideskriptor
    mov ecx, message  ; Zeiger auf die Nachricht
    mov edx, msg_len  ; Länge der Nachricht
    int 0x80  ; Systemaufruf ausführen

    ; Datei schließen
    mov eax, 6  ; Systemaufrufnummer für sys_close
    mov ebx, [file_descriptor]  ; Dateideskriptor
    int 0x80  ; Systemaufruf ausführen

    ; Programm beenden
    mov eax, 1  ; Systemaufrufnummer für sys_exit
    xor ebx, ebx  ; Rückgabewert 0
    int 0x80  ; Systemaufruf ausführen

    ; Selbstmodifizierender Code
    mov byte [message], 'H'  ; Modifiziert die Nachricht

