; Comment outside
section .data
    format db "; Comment outside%1$csection .data%1$c    format db %2$c%3$s%2$c%1$c%1$csection .text%1$c    extern printf%1$c    extern stdout%1$c    extern fflush%1$c    global main%1$c%1$cleave:%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    and rsp, -16%1$c    ; Comment in main%1$c    sub rsp, 16%1$c    mov rdi, format%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    mov rcx, format%1$c    xor rax, rax%1$c    call printf%1$c    mov rdi, [rel stdout]%1$c    call fflush%1$c    call leave%1$c"

section .text
    extern printf
    extern stdout
    extern fflush
    global main

leave:
    mov rax, 60
    xor rdi, rdi
    syscall

main:
    push rbp
    mov rbp, rsp
    and rsp, -16
    ; Comment in main
    sub rsp, 16
    mov rdi, format
    mov rsi, 10
    mov rdx, 34
    mov rcx, format
    xor rax, rax
    call printf
    mov rdi, [rel stdout]
    call fflush
    call leave
