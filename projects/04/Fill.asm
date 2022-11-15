// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Reset the variable i (index to draw at)
(SETUP)
@8192
D = A
@i
M = D
@SCREEN
D = A
@i
M = M + D
M = M - 1

// Main loop body
(LOOP)
// Keyboard dectector
@KBD
D = M
// If keyboard, go to black
@BLACK
D; JGT
@WHITE
0; JMP

(WHITE)
@i
A = M
M = 0

@i
M = M - 1
D = M
@SCREEN
D = D - A
@SETUP
D; JLT
@WHITE
0; JMP

// for(i=8192+screen; i >= screen, i--)
(BLACK)
// Set RAM[i] = BLACK
@i
A = M
M = -1

@i
// Decrement I
M = M - 1
D = M
@SCREEN
D = D - A
// If i = beginning of screen
@SETUP
D; JLT
@BLACK
0; JMP
