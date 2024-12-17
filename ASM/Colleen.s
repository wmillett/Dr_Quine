section .data
    format db "section .data%1$c    format db %2$c%3$s%2$c,10,34,format%1$csection .text%1$c    extern printf%1$c    global main%1$cmain:%1$c    mov rdi, format       ; Load the format string into rdi%1$c    mov rsi, 10           ; rsi = newline character%1$c    mov rdx, 34           ; rdx = double quote character%1$c    mov rcx, format       ; rcx = the format string itself%1$c    xor rax, rax          ; Clear rax for printf%1$c    call printf           ; Call printf%1$c    xor rax, rax          ; Return 0%1$c    ret%1$c",10,34

section .text
    extern printf
    global main
main:
    mov rdi, format       ; Load the format string into rdi
    mov rsi, 10           ; rsi = newline character
    mov rdx, 34           ; rdx = double quote character
    mov rcx, format       ; rcx = the format string itself
    xor rax, rax          ; Clear rax for printf
    call printf           ; Call printf
    xor rax, rax          ; Return 0
    ret
