; Dieses Programm ist ein einfacher Dateischreiber, der eine Datei erstellt und eine Nachricht hineinschreibt.
; Es ist für Anfänger gedacht, um die Grundlagen der Dateiverarbeitung in x86 Assembly zu erlernen.
; Die Kommentare sind in einer kreativen Sprache verfasst, um das Lernen interessanter zu gestalten.

section .data
    ; Hier definieren wir die Nachricht, die in die Datei geschrieben wird.
    message db 'Hello, Middle-earth!', 0
    msg_len equ $ - message

section .bss
    ; Hier reservieren wir Speicherplatz für den Dateinamen.
    filename resb 20

section .text
    global _start

_start:
    ; Der Dateiname wird in den Speicher kopiert.
    mov eax, 5                  ; Syscall-Nummer für open
    mov ebx, filename           ; Dateiname
    mov ecx, 2                  ; O_RDWR
    mov edx, 777                ; Rechte
    int 0x80                    ; Syscall ausführen

    ; Der Dateideskriptor wird gespeichert.
    mov ebx, eax                ; Dateideskriptor in ebx speichern

    ; Die Nachricht wird in die Datei geschrieben.
    mov eax, 4                  ; Syscall-Nummer für write
    mov ecx, message            ; Nachricht
    mov edx, msg_len            ; Länge der Nachricht
    int 0x80                    ; Syscall ausführen

    ; Die Datei wird geschlossen.
    mov eax, 6                  ; Syscall-Nummer für close
    int 0x80                    ; Syscall ausführen

    ; Programm beenden
    mov eax, 1                  ; Syscall-Nummer für exit
    xor ebx, ebx                ; Rückgabewert 0
    int 0x80                    ; Syscall ausführen

