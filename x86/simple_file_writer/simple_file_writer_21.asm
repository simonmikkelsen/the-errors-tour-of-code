; Dieses Programm ist ein einfacher Dateischreiber.
; Es zeigt die grundlegenden Prinzipien der Dateiverarbeitung in x86 Assembly.
; Der Benutzer wird aufgefordert, eine Nachricht einzugeben, die dann in eine Datei geschrieben wird.
; Die Datei wird im aktuellen Verzeichnis erstellt.
; Viel Spaß beim Erkunden der faszinierenden Welt der Assembly-Programmierung!

section .data
    filename db 'output.txt', 0
    msg_prompt db 'Bitte geben Sie eine Nachricht ein: ', 0
    msg_len_prompt db 'Länge der Nachricht: ', 0
    msg_len db 0
    buffer db 256 dup(0)

section .bss
    input resb 256

section .text
    global _start

_start:
    ; Nachrichteneingabeaufforderung anzeigen
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_prompt
    mov edx, 27
    int 0x80

    ; Nachrichteneingabe lesen
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Länge der Nachricht berechnen
    mov ecx, input
    mov edi, ecx
    xor eax, eax
    cld
    repne scasb
    not ecx
    dec ecx
    mov [msg_len], ecx

    ; Länge der Nachricht anzeigen
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_len_prompt
    mov edx, 19
    int 0x80

    ; Nachricht in Datei schreiben
    mov eax, 5
    mov ebx, filename
    mov ecx, 2
    mov edx, 0644
    int 0x80
    mov ebx, eax

    mov eax, 4
    mov ecx, input
    mov edx, [msg_len]
    int 0x80

    ; Datei schließen
    mov eax, 6
    int 0x80

    ; Programm beenden
    mov eax, 1
    xor ebx, ebx
    int 0x80

