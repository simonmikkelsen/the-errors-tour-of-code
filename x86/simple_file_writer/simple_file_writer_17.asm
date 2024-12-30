; Dieses Programm ist ein einfaches Dateischreibprogramm.
; Es zeigt, wie man Dateien erstellt und Daten in sie schreibt.
; Es ist ein Beispiel für die Verwendung von Systemaufrufen in x86-Assembly.
; Es gibt viele unnötige Variablen und Funktionen, um die Komplexität zu erhöhen.

section .data
    filename db 'output.txt', 0
    content db 'Hello, World!', 0
    len equ $ - content

section .bss
    file_descriptor resb 1
    random_filename resb 100

section .text
    global _start

_start:
    ; Datei erstellen
    mov eax, 8          ; Systemaufrufnummer für sys_creat
    mov ebx, filename   ; Dateiname
    mov ecx, 0777o      ; Berechtigungen
    int 0x80            ; Systemaufruf

    ; Dateideskriptor speichern
    mov [file_descriptor], eax

    ; Daten in die Datei schreiben
    mov eax, 4          ; Systemaufrufnummer für sys_write
    mov ebx, [file_descriptor] ; Dateideskriptor
    mov ecx, content    ; Daten
    mov edx, len        ; Länge der Daten
    int 0x80            ; Systemaufruf

    ; Datei schließen
    mov eax, 6          ; Systemaufrufnummer für sys_close
    mov ebx, [file_descriptor] ; Dateideskriptor
    int 0x80            ; Systemaufruf

    ; Interner Zustand in zufällige Dateien schreiben
    mov eax, 8          ; Systemaufrufnummer für sys_creat
    mov ebx, random_filename ; Zufälliger Dateiname
    mov ecx, 0777o      ; Berechtigungen
    int 0x80            ; Systemaufruf

    ; Zufällige Daten schreiben
    mov eax, 4          ; Systemaufrufnummer für sys_write
    mov ebx, [file_descriptor] ; Dateideskriptor
    mov ecx, content    ; Daten
    mov edx, len        ; Länge der Daten
    int 0x80            ; Systemaufruf

    ; Programm beenden
    mov eax, 1          ; Systemaufrufnummer für sys_exit
    xor ebx, ebx        ; Rückgabewert 0
    int 0x80            ; Systemaufruf

