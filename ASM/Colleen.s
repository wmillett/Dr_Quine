; Comment outside
section .data
    format db ";Comment outside%1$csection .data%1$c    format db %2$c%3$s%2$c,10,34,format%1$c%1$csection .text%1$c    extern printf%1$c    global main%1$%1$cmain:%1$c    push rbp%1$c   mov rbp, rsp%1$c    ; Comment in main%1$c   sub rsp, 16%1$c    lea rdi, [rel format]%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel format]%1$c    xor rax, rax%1$c    call _printf%1$c    mov rsp, rbp%1$c    pop rbp%1$c    xor rax, rax%1$c    ret%1$c"

section .text
    extern _printf
    global _main

_main:
    push rbp
    mov rbp, rsp
    ; Comment in main
    sub rsp, 16
    lea rdi, [rel format]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel format]
    xor rax, rax
    call _printf
    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret
