// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(FOREVER)

        @bit        // clear screen by resetting bits
        M = 0
        @SCREEN     // otherwise prepare to fill screen
        D = A
        @address
        M = D - 1

        @KBD
        D = M       // sample keyboard memory
        @RESET      // clear screen if no key pressed
        D; JEQ

        @bit        // else assert bit
        M = -1

    (RESET)
        @address    // increment address to next word in SCREEN block
        M = M + 1

        @bit        // retrieve characteristic bit
        D = M

        @address    // zero or assert all pixels
        A = M

        M = D

        D = A + 1   // check if we'll exceeded SCREEN block on next cycle
        @KBD
        D = D - A
        @RESET
        D; JLT

        @FOREVER
        0; JMP      // loop forever
