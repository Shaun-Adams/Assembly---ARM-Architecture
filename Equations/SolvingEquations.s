/*
Assuming x is in R1, y in R2, z in R3 and the result in R0, write and test an
ARM assembly language program to evaluate the following expressions:
a. f (x , y )=5x^2 + 3x + 10
b. f (x , y )=2x^2 + 7xy + 5y^2 − 7
c. f (x , y )=x^3 − 2x^2 + 2x + 5
d. f (x , y ,z)=2x^4 − 6x − 5y^3z + 10
All four problems must be solved, one after another in the same code. Your code
must be tested by using x=10 , y=5 and z=2 
*/

.global main

.output:                    //@ function to output the answer
	.asciz "answer: %d\n"   //@ printing out the answer

main:                       //@ main function 
    push {ip, lr}           //@ push onto stack


@------------------------------------------------------------------------------------------------------------------------------------------------------
//@function_a 

    mov r1, #10		        //@ store value 10 in register 1
    mul r4, r1, r1          //@ multiply r1 x r1 (10*10 = 100) in register 4 
    mov r2, #5              //@ store value of 5 in register 2
    mul r4, r2, r4          //@ multiply r4 x r2 (100*5 = 500) in register 4 (reusing r4)
    mov r6, #3              //@ store value of 3 in register 6
	mla r5, r6, r1, r1      //@ multiply r3 x r1 (3*10=30) in register 5 and add r5 + r1 (30+10=40) in register 5
	add r0, r4, r5          //@ add r4 + r5 (500+40=540) in register 0 to display on monitor
	
	mov r1, r0
	ldr r0, =.output
	bl printf
@-------------------------------------------------------------------------------------------------------------------------------------------------------


@-------------------------------------------------------------------------------------------------------------------------------------------------------
//@function_b 

    mov r1, #10             //@ store value 10 in register 1
    mul r4, r1, r1          //@ multiply r1 x r1 (10*10 = 100) in register 4 
    mov r2, #5              //@ store value of 5 in register 2
    mov r3, #2              //@ store value of 2 in register 3    
    mul r4, r3, r4        	//@ multiply r4 x r3 (100*2 = 200) in register 4 (reusing r4)
    mov r5, #7              //@ store value of 7 in register 5
   	mul r6, r5, r1          //@ multiply r5 x r1 (7*10=70) in register 6 
   	mla r6, r2, r6, r4      //@ multiply r6 x r2 (70*5=350) in register 6 and add r6 + r4 (350+200=550) reusing register 6
   	
	mul r5, r2, r2          //@ multiply r2 x r2 (5*5=25) reusing register 5
   	mul r5, r2, r5		    //@ multiply r5 x r2 (25x5=125) in register 5
	sub r5, r5, #7		    //@ subtract r5 - #7 (125-7=118) reusing register 5
	add r0, r5, r6         	//@ add r5 + r6 (118+550=668) in register 0 to display on monitor        
    

	mov r1, r0
    ldr r0, =.output
	bl printf
@--------------------------------------------------------------------------------------------------------------------------------------------------------



@---------------------------------------------------------------------------------------------------------------------------------------------------------
//@function_c 

    mov r1, #10             //@ store value 10 in register 1
    mul r4, r1, r1          //@ multiply r1 x r1 (10*10 = 100) in register 4 
    mul r4, r1, r4          //@ multiply r4 x r1 (100*10 = 1000) reuse register 4
    
    mov r2, #5              //@ store value of 5 in register 2
    mov r3, #2              //@ store value of 2 in register 3    
    
    mul r5, r1, r1          //@ multiply r1 x r1 (10*10 = 100) in register 5 
    mul r5, r3, r5          //@ multiply r5 x r3 (100*2 = 200) reuse register 5
    sub r4, r4, r5          //@ subtract r4 - r5 (1000-200=800) reuse register 4
    mla r6, r1, r3, r2      //@ multiply r1 x r3 (10*2=20) in register 6 and add r6 + r2 (20+5=25) reusing register 6
    add r0, r4, r6          //@ add r4 + r6 (800+25=825) in register 0 to display on monitor  
	
	mov r1, r0
	ldr r0, =.output
	bl printf
@---------------------------------------------------------------------------------------------------------------------------------------------------------



@---------------------------------------------------------------------------------------------------------------------------------------------------------
//@function_d 

    mov r1, #10             //@ store value 10 in register 1
    mul r4, r1, r1          //@ multiply r1 x r1 (10x10 = 100) in register 4 
    mul r4, r1, r4          //@ multiply r4 x r1 (100x10 = 1000) reuse register 4
    mul r4, r1, r4          //@ multiply r4 x r1 (1000x10 = 10000) reuse register 4    
        
    mov r2, #5              //@ store value of 5 in register 2
    mov r3, #2              //@ store value of 2 in register 3    
    mul r4, r3, r4          //@ multiply r4 x r3 (10000x2 = 20000) in register 4 (reusing r4)
    mov r5, #6              //@ store value of 6 in register 5
    mul r5, r1, r5          //@ multiply r5 x r1 (6x10 = 60) reuse register 5
    sub r4, r4, r5          //@ subtract r4 - r5 (20000-60 = 19940) reuse register 4

   	mul r6, r2, r2          //@ multiply r2 x r2 (5x5=25) in register 6
    mul r6, r2, r6          //@ multiply r6 x r2 (25x5=125) reuse register 6
    mul r6, r2, r6          //@ multiply r6 x r2 (125x5=625) reuse register 6
    mul r6, r3, r6		    //@ multiply r6 x r3 (625x2=1250) reuse register 6
    sub r4, r4, r6          //@ subtract r4 - r6 (19940-1250=18690) reuse register 4
	add r0, r4, r1          //@ add r4 + r1 (18690+10=18700) in register 0 to display on monitor  
	
	mov r1, r0
	ldr r0, =.output
	bl printf
@----------------------------------------------------------------------------------------------------------------------------------------------------------
	pop {ip, pc}            //@ pop from the stack. push and pop from stack helps avoid getting Segmantation faults

