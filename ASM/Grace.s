; Comment required

section .data
    st: db "; Comment required%1$c%1$csection .data%1$c    st: db %2$c%3$s%2$c,0%1$c    fn: db 'Grace_kid.s'%1$csection .text%1$c    global main%1$c    extern dprintf%1$c    extern open%1$c    extern close%1$c%4$cdefine MS main:%1$c%4$cmacro FT 0%1$c    MS%1$c    push rbp%1$c    mov rbp, rsp%1$c    mov rsi, 0x241%1$c    lea rdi, [rel fn]%1$c    call open%1$c    cmp rax, 0xfffffff%1$c    jge exit%1$c    mov rdi, rax%1$c    lea rsi, [rel st]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel st]%1$c    mov r9, 37%1$c    call dprintf%1$c    exit:%1$c    call close%1$c    leave%1$c    ret%1$c%4$cendmacro%1$cFT%1$c",0
    fn: db 'Grace_kid.s'
section .text
    global main
    extern dprintf
    extern open
    extern close
%define MS main:
%macro FT 0
    MS
    push rbp
    mov rbp, rsp
    mov rsi, 0x241
    lea rdi, [rel fn]
    call open
    cmp rax, 0xfffffff
    jge exit
    mov rdi, rax
    lea rsi, [rel st]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel st]
    mov r9, 37
    call dprintf
    exit:
    call close
    leave
    ret
%endmacro
FT
