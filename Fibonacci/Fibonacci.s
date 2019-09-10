/*
The n-th Fibonacci number Fn is defined recursively as Fn=F(n−1)+F(n−2) where F0=0 and F1=1. For instance, F2=F1+F0=1+0=1, F3=F2+F1=1+1=2 and
F4=F3+F2=2+1=3. Write an ARM Assembly Language program to compute the n-th Fibonacci number Fn
compute F15 and F30
F15= 610 
F30= 832040
*/

.global main

.output1:			        //function to output answer
    .asciz "F15 = %d\n"	    // printing out the answer

.output2:			        // function to print answer
	.asciz "F30 = %d\n"	    // printing out the answer

main:				        // main function
	push {ip, lr}		    // push onto stack		

@-------------------------------------------------------------------------------------------------
//Question 1: F15= 610

	mov r1, #1		        // store value 1 in register 1
	mov r2, #0		        // store value 2 in register 2
	mov r3, #1		        // store value 1 in register 3

loop1:				        // loop to calculate the fibonacci number
	cmp r1, #14		        // compares register 1 with the value of 14 
	bgt end1		        // branch out of loop if number reached 14
	mov r4, r3		        // store value of register 3 in register 4
	add r3, r3, r2		    // add r3+r2 in r3
	mov r2, r4		        // store value of register 4 in register 2
	add r1, r1, #1		    // add r1+1 in register 1
	b loop1			        // branch out of loop

end1:				        // end function to output answer
	mov r0, r3		        // store value of register 3 in register 0 to display on monitor
	mov r1, r0		
	ldr R0, =.output1	    // to load the message of .output1 in register 0
	bl printf		        // print

@-------------------------------------------------------------------------------------------------
//Question 2: F30= 832040

	mov r1, #1		        // store value 1 in register 1
	mov r2, #0		        // store value 2 in register 2
	mov r3, #1		        // store value 1 in register 3

loop2:                      // loop to calculate the fibonacci number
    cmp r1, #29		        // compares register 1 with the value of 29 
	bgt end1			    // branch out of loop if number reached 29
	mov r4, r3		        // store value of register 3 in register 4
	add r3, r3, r2		    // add r3+r2 in r3
	mov r2, r4		        // store value of register 4 in register 2
	add r1, r1, #1		    // add r1+1 in register 1
	b loop2			        // branch out of loop

end2:				        // end function to output answer
    mov r0, r3		        // store value of register 3 in register 0 to display on monitor
	mov r1, r0		
	ldr R0, =.output2	    // to load the message of .output2 in register 0
	bl printf		        // print

    pop {ip, pc}            //@ pop from the stack. push and pop from stack helps avoid getting Segmantation faults
