; xcode-select version 2396
; NASM version 2.16.01
; Intel Mac on 13.2.1 Ventura
; Variable Definitions
section .data
    message_var db 'Hello, World!',0
    ; "$ evaluates to the assembly position at the beginning of the line containing the expression;"
    length_var equ $ - message_var ; 13 Bytes including the null terminator 0

; Defined entry point. Think __main__ in py
section .text
    global _main ; ld -e _main

_main:
    ; write message to console
    mov rsi, message_var ; address of message to print
    mov rdx, length_var  ; number of bytes to print
    mov rdi, 1           ; file descriptor for stdout
    mov rax, 0x2000004   ; return "write" system function call specific to mac's address
    syscall             ; call the kernel to execute our setup so the message is printed

    ; exit program
    xor rdi, rdi         ; pass 0 code, or ok, arg to exit
    mov rax, 0x2000001   ; return "exit" system function call specific to mac's address
    syscall              ; call the kernel to exit program
