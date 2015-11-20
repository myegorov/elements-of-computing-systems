// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


    @R2
    M = 0       // initialize M[R2] = 0

    (LOOP)          // while (R0 > 0)
        @R0
        D = M
        @END
        D; JEQ      // no need to iterate if one of factors == 0

        @R1
        D = M       // D = M[R1]
        @R2
        M = D + M   // M[R2] = M[R2] + M[R1]

        @R0         // decrement R0
        M = M - 1

        @LOOP
        0; JMP      // goto LOOP unconditionally

        (END)
            @END
            0; JMP      // infinite loop
