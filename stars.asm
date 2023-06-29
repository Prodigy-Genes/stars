section .data
	stars db "*", 0ah ; Define a variable 'stars' as a string containing a single asterisk (*) followed by a newline character (0ah).
	new_line db 10 ; Define a variable 'new_line' as a single newline character (10).

; The code below is located in the .text section.

section .text
	global _start

_start:
	mov rax, 1 ; Move the value 1 into the rax register, which represents the system call number for 'write'.
	mov rdi, 1 ; Move the value 1 into the rdi register, which represents the file descriptor for 'stdout'.
	mov rsi, stars ; Move the memory address of the 'stars' variable into the rsi register, which represents the buffer to be printed.
	mov rdx, 9 ; Move the value 9 into the rdx register, which represents the number of bytes to be printed.
	syscall ; Invoke the system call to print the 'stars' variable.

print_star:
	mov rax, 1 ; Move the value 1 into the rax register, which represents the system call number for 'write'.
	syscall ; Invoke the system call to print a single asterisk.
	dec rdx ; Decrement the value in the rdx register.
	jnz print_star ; Jump to 'print_star' if the zero flag is not set (rdx is not zero).

	mov rax, 1 ; Move the value 1 into the rax register, which represents the system call number for 'write'.
	mov rsi, new_line ; Move the memory address of the 'new_line' variable into the rsi register, which represents the buffer to be printed.
	mov rdx, 1 ; Move the value 1 into the rdx register, which represents the number of bytes to be printed.
	syscall ; Invoke the system call to print a newline character.

exit:
	mov rax, 60 ; Move the value 60 into the rax register, which represents the system call number for 'exit'.
	mov rdi, 0 ; Move the value 0 into the rdi register, which represents the exit status.
	syscall ; Invoke the system call to exit the program.

