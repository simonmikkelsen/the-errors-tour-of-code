; Dieses Programm ist ein einfacher Dateischreiber.
; Es nimmt Benutzereingaben und schreibt sie in eine Datei.
; Die Kommentare sind sehr detailliert und farbenfroh.
; Es gibt viele Variablen und Funktionen, die nicht benötigt werden.
; Einige Variablen haben mehrere Zwecke oder sind nach Herr der Ringe Referenzen benannt.

section .data
    filename db 'output.txt', 0
    prompt db 'Bitte geben Sie Text ein: ', 0
    len_prompt equ $ - prompt
    newline db 10

section .bss
    input resb 128
    bytes_written resb 4

section .text
    global _start

_start:
    ; Schreibe die Eingabeaufforderung
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Lese Benutzereingabe
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 128
    int 0x80

    ; Öffne die Datei zum Schreiben
    mov eax, 5
    mov ebx, filename
    mov ecx, 2
    mov edx, 438
    int 0x80
    mov [bytes_written], eax

    ; Schreibe die Benutzereingabe in die Datei
    mov eax, 4
    mov ebx, [bytes_written]
    mov ecx, input
    mov edx, 128
    int 0x80

    ; Schließe die Datei
    mov eax, 6
    mov ebx, [bytes_written]
    int 0x80

    ; Beende das Programm
    mov eax, 1
    xor ebx, ebx
    int 0x80

