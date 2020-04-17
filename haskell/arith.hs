data Arithmetic = Value Int 
  		| Arithmetic :+ Arithmetic 
		| Arithmetic :* Arithmetic 
		| Arithmetic :/ Arithmetic 
		| Neg Arithmetic 
		| Exp Arithmetic Arithmetic 
  deriving Show

evaluate (Exp a b) = evaluate(a) ^ evaluate(b) 
evaluate (Neg a) = (-1) * (evaluate a)
evaluate (Value a) = a
evaluate (a :+ b) = (evaluate a) + (evaluate b)
evaluate (a :* b) = (evaluate a) * (evaluate b)
evaluate (a :/ b) = (evaluate a) `div` (evaluate b)
