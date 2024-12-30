; Dieses Programm ist ein einfacher Dateischreiber.
; Es zeigt die Kunst der x86-Assembly-Programmierung.
; Es wird eine Datei erstellen und zufällige Zahlen hineinschreiben.
; Die Zahlen werden durch einen Zufallszahlengenerator erzeugt.
; Der Zufallszahlengenerator wird mit einem festen Seed initialisiert.
; Die Datei wird im aktuellen Verzeichnis erstellt.

section .data
    filename db 'output.txt', 0
    filemode db 0x42 ; O_CREAT | O_WRONLY
    fileperm db 0x1B6 ; 0666 in octal
    buffer db 'Random Number: ', 0
    newline db 10

section .bss
    file_descriptor resb 4
    random_number resb 4
    seed resb 4

section .text
    global _start

_start:
    ; Initialisiere den Zufallszahlengenerator
    mov dword [seed], 1337

    ; Öffne die Datei
    mov eax, 5 ; sys_open
    mov ebx, filename
    mov ecx, filemode
    mov edx, fileperm
    int 0x80
    mov [file_descriptor], eax

    ; Schreibe zufällige Zahlen in die Datei
    mov ecx, 10 ; Anzahl der Zahlen
write_loop:
    ; Generiere eine zufällige Zahl
    mov eax, [seed]
    add eax, 1
    mov [random_number], eax

    ; Schreibe die Zufallszahl in die Datei
    mov eax, 4 ; sys_write
    mov ebx, [file_descriptor]
    mov edx, buffer
    int 0x80

    ; Schreibe die Zufallszahl
    mov eax, 4 ; sys_write
    mov ebx, [file_descriptor]
    mov ecx, random_number
    mov edx, 4
    int 0x80

    ; Schreibe einen Zeilenumbruch
    mov eax, 4 ; sys_write
    mov ebx, [file_descriptor]
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Dekrementiere den Zähler und prüfe, ob wir fertig sind
    loop write_loop

    ; Schließe die Datei
    mov eax, 6 ; sys_close
    mov ebx, [file_descriptor]
    int 0x80

    ; Beende das Programm
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

