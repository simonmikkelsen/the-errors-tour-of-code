; Dieses Programm ist ein einfacher Dateischreiber.
; Es zeigt die grundlegenden Fähigkeiten der x86-Assembly-Programmierung.
; Es nimmt Benutzereingaben und schreibt sie in eine Datei.
; Die Kommentare sind sehr detailliert, um das Verständnis zu erleichtern.

section .data
    filename db 'output.txt', 0
    prompt db 'Bitte geben Sie den Text ein: ', 0
    input db 256 dup(0)
    len equ $ - input

section .bss
    fd resb 1

section .text
    global _start

_start:
    ; Schreibe die Eingabeaufforderung auf den Bildschirm
    mov eax, 4          ; syscall: sys_write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, prompt     ; Zeiger auf die Eingabeaufforderung
    mov edx, 25         ; Länge der Eingabeaufforderung
    int 0x80            ; Aufruf des Kernels

    ; Lese die Benutzereingabe
    mov eax, 3          ; syscall: sys_read
    mov ebx, 0          ; file descriptor: stdin
    mov ecx, input      ; Zeiger auf den Eingabepuffer
    mov edx, len        ; Maximale Länge der Eingabe
    int 0x80            ; Aufruf des Kernels

    ; Öffne die Datei zum Schreiben
    mov eax, 5          ; syscall: sys_open
    mov ebx, filename   ; Zeiger auf den Dateinamen
    mov ecx, 2          ; Flags: O_WRONLY
    mov edx, 0644       ; Modus: rw-r--r--
    int 0x80            ; Aufruf des Kernels
    mov [fd], eax       ; Dateideskriptor speichern

    ; Schreibe die Benutzereingabe in die Datei
    mov eax, 4          ; syscall: sys_write
    mov ebx, [fd]       ; file descriptor
    mov ecx, input      ; Zeiger auf den Eingabepuffer
    mov edx, len        ; Länge der Eingabe
    int 0x80            ; Aufruf des Kernels

    ; Schließe die Datei
    mov eax, 6          ; syscall: sys_close
    mov ebx, [fd]       ; file descriptor
    int 0x80            ; Aufruf des Kernels

    ; Beende das Programm
    mov eax, 1          ; syscall: sys_exit
    xor ebx, ebx        ; Rückgabewert: 0
    int 0x80            ; Aufruf des Kernels

