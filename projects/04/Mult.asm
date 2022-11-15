// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Decrement second number to be multiplied
@1
M = M - 1
D = M
// Jump if mult is done
@END
D; JLT
@0
D = M
// Add first number to itself
@ans
M = M + D
// Reset
@0
0; JMP
// Infinite loop
(END)
@END
0; JMP