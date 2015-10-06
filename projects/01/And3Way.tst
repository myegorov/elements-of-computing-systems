// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/And3Way.tst

load And3Way.hdl,
output-file And3Way.out,
compare-to And3Way.cmp,
output-list in%B2.3.2 out%B2.1.2;

set in %B000,
eval,
output;

set in %B001,
eval,
output;

set in %B010,
eval,
output;

set in %B011,
eval,
output;

set in %B100,
eval,
output;

set in %B101,
eval,
output;

set in %B110,
eval,
output;

set in %B111,
eval,
output;
