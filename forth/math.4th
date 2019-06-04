\ Note: Just some utils so we can make the floating point division
: FLOATDIVIDE SWAP S>D D>F S>D D>F F/ F. ;
: DIVIDE SWAP FLOATDIVIDE ;


\ Note: This should be called with (c a b) on the stack (:
: A2ABC  SWAP DUP DUP 2SWAP SWAP * ROT ROT * + + ;

\ Note: This should be called with (a b) as the stack (:
: MINUSDIVPLUS 2DUP + ROT ROT - DIVIDE ; 
