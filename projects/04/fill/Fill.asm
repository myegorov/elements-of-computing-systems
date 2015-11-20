// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(FOREVER)           // loop to listen to keyboard input forever

        @bit        // set default bit to clear screen
        M = 0
        @SCREEN     // initialize variable to point to current word in screen
        D = A
        @address
        M = D

        @KBD
        D = M       // sample keyboard value
        @RESET      // clear screen if no key pressed
        D; JEQ

        @bit        // else assert bit to fill screen
        M = -1

        (RESET)         // loop to fill or clear screen
            @bit        // retrieve characteristic bit and store in D register
            D = M

            @address    // retrieve address and store in A register
            A = M

            M = D       // set M[address] = <characteristic-bit>

            D = A + 1   // update current address and
            @address    // check if we'll exceeded SCREEN block on next cycle
            M = D
            @KBD
            D = D - A
            @RESET
            D; JLT

        @FOREVER
        0; JMP      // return to outer look to sample keyboard
