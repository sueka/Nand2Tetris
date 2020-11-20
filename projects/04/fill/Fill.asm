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

(LOOP)
  @i
  M=1
  @KBD
  D=M
  @CLS_LOOP
  D;JEQ
  @FILL_LOOP
  0;JMP

(CLS_LOOP)
  @i
  D=M
  @8192
  D=D-A
  @LOOP
  D;JGT
  @i
  D=M-1
  @SCREEN
  A=D+A
  M=0
  @i
  M=M+1
  @CLS_LOOP
  0;JMP

(FILL_LOOP)
  @i
  D=M
  @8192
  D=D-A
  @LOOP
  D;JGT
  @i
  D=M-1
  @SCREEN
  A=D+A
  M=-1
  @i
  M=M+1
  @FILL_LOOP
  0;JMP
