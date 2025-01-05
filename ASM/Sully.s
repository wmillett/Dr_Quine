section .data
    sully_str db 'section .data%1$c    sully_str db %2$c%3$s%2$c,0%1$c    format db %2$cSully_%%d.c%2$c,0%1$c    format_exec db %2$cSully_%%d%2$c,0%1$c    format_cmd db %2$cclang -Wall -Wextra -Werror %%s -o %%s && ./%%s%2$c,0%1$csection .bss%1$c    filename resb 20%1$c    execname resb 20%1$c    command resb 255%1$csection .text%1$c    global ft%1$cft:%1$c    ; Initialize variables%1$c    mov rax, 5 ; Initialize i%1$c    cmp rax, 0%1$c    jle exit%1$c%1$c    ; Create filename%1$c    lea rdi, [filename]%1$c    mov rsi, format%1$c    mov rdx, rax%1$c    dec rdx ; i - 1%1$c    call sprintf%1$c%1$c    ; Open file%1$c    lea rdi, [filename]%1$c    mov rsi, write_flag%1$c    call fopen%1$c    test rax, rax%1$c    jz exit%1$c    mov rdi, rax ; Save file pointer%1$c%1$c    ; Write content to file%1$c    lea rsi, [sully_str]%1$c    mov rdx, r10 ; 10%1$c    mov rcx, r11 ; 9%1$c    mov r8, r12  ; 34%1$c    mov r9, rax  ; Sully(), i - 1%1$c    call fprintf%1$c%1$c    ; Close file%1$c    call fclose%1$c%1$c    ; Create execname%1$c    lea rdi, [execname]%1$c    mov rsi, format_exec%1$c    mov rdx, rax%1$c    call sprintf%1$c%1$c    ; Create command%1$c    lea rdi, [command]%1$c    mov rsi, format_cmd%1$c    lea rdx, [filename]%1$c    lea rcx, [execname]%1$c    call sprintf%1$c%1$c    ; Execute command%1$c    lea rdi, [command]%1$c    call system%1$c%1$c    exit:%1$c    mov rax, 60 ; Exit syscall%1$c    xor rdi, rdi%1$c    syscall', 0
    format db "Sully_%d.c", 0
    format_exec db "Sully_%d", 0
    format_cmd db "clang -Wall -Wextra -Werror %s -o %s && ./%s", 0

section .bss
    filename resb 20
    execname resb 20
    command resb 255

section .text
    extern sprintf
    extern fopen
    extern fprintf
    extern fclose
    extern system
    global ft

ft:
    ; Initialize i = 5
    mov rax, 5

    ; Check if i <= 0
    cmp rax, 0
    jle exit

    ; Create filename (sprintf(filename, "Sully_%d.c", i - 1))
    lea rdi, [filename]
    mov rsi, format
    mov rdx, rax
    dec rdx ; i - 1
    call sprintf

    ; Open file
    lea rdi, [filename]
    mov rsi, "w"
    call fopen
    test rax, rax
    jz exit
    mov rdi, rax ; Save file pointer

    ; Write content to file
    lea rsi, [sully_str]
    mov rdx, 10
    mov rcx, 9
    mov r8, 34
    mov r9, rax ; Sully(), i - 1
    call fprintf

    ; Close file
    call fclose

    ; Create execname (sprintf(execname, "Sully_%d", i - 1))
    lea rdi, [execname]
    mov rsi, format_exec
    mov rdx, rax
    call sprintf

    ; Create command (sprintf(command, "clang -Wall -Wextra -Werror %s -o %s && ./%s", filename, execname, execname))
    lea rdi, [command]
    mov rsi, format_cmd
    lea rdx, [filename]
    lea rcx, [execname]
    call sprintf

    ; Execute command (system(command))
    lea rdi, [command]
    call system

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
