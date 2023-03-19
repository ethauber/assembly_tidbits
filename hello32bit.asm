; Variable Definitions
section .data
    message_var db 'Hello, World!',0
    ; "$ evaluates to the assembly position at the beginning of the line containing the expression;"
    length_var equ $ - message_var ; 13 Bytes including the null terminator 0

; Defined entry point. Think __main__ in py
section .text
    global _main ; Usually _start but we'll specify -e _main

_main:
    ; write message to console
    mov ecx, message_var ; address of message to print
    mov edx, length_var  ; number of bytes to print
    mov ebx, 1           ; file descriptor for stdout
    mov eax, 4           ; return "write" system function call defined as 4 code 
    int 0x80             ; call the kernel to execute our setup so the message is printed

    ; exit program
    xor ebx, ebx         ; pass 0 code, or ok, arg to exit
    mov eax, 1           ; return "exit" system function call with code 0
    int 0x80             ; call the kernel to exit program
