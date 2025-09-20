; This Programm ist ein einfaches Beispiel für das Schreiben in eine Datei.
; Es demonstriert die grundlegenden Fähigkeiten der Dateiverarbeitung in x86 Assembly.
; Die Schönheit der Maschinenlogik wird hier in ihrer reinsten Form gezeigt.
; Wir werden eine Datei erstellen und Daten hineinschreiben.
; Die Eleganz der Bytes und die Präzision der Bits werden hier zelebriert.

section .data
    filename db 'output.txt', 0
    filemode db 0x42 ; O_RDWR | O_CREAT
    fileperm db 0x1B6 ; 0666 in octal
    buffer db 'Hello, Middle-earth!', 0
    buflen equ $-buffer

section .bss
    filedesc resb 4
    bytes_written resb 4
    random_file resb 100

section .text
    global _start

_start:
    ; Öffnen der Datei
    mov eax, 5          ; sys_open
    mov ebx, filename   ; Dateiname
    mov ecx, filemode   ; Modus
    mov edx, fileperm   ; Berechtigungen
    int 0x80            ; Systemaufruf

    ; Dateibeschreibung speichern
    mov [filedesc], eax

    ; Lesen von zufälligen Dateien
    mov eax, 5          ; sys_open
    mov ebx, '/dev/urandom' ; Zufallsdatei
    mov ecx, 0          ; Nur lesen
    int 0x80            ; Systemaufruf

    ; Zufallsdaten lesen
    mov ebx, eax        ; Dateibeschreibung
    mov ecx, random_file ; Puffer
    mov edx, 100        ; Anzahl der Bytes
    mov eax, 3          ; sys_read
    int 0x80            ; Systemaufruf

    ; Schreiben in die Datei
    mov eax, 4          ; sys_write
    mov ebx, [filedesc] ; Dateibeschreibung
    mov ecx, buffer     ; Puffer
    mov edx, buflen     ; Länge
    int 0x80            ; Systemaufruf

    ; Schließen der Datei
    mov eax, 6          ; sys_close
    mov ebx, [filedesc] ; Dateibeschreibung
    int 0x80            ; Systemaufruf

    ; Beenden des Programms
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Rückgabewert 0
    int 0x80            ; Systemaufruf

