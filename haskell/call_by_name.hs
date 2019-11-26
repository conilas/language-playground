cond :: Bool -> Integer -> Integer -> Integer
cond c a b = if c then a else b

fac :: Integer -> Integer
fac n =  let condition = n == 1 in 
           let decn = n-1 in
	     let value = n*fac decn in
	       cond condition n value


-- in here we can clearly see why we can use lazy evaluation
-- it is, however, not tail recursive. this is for demonstration purposes
-- equivalent in js follows:
-- const cond = (con, first, second) => con ? first : second;
-- const facc = (number) => {
--  const condition = number == 1;
--  const decn = number - 1;
--  const value = number * facc(number-1);
--  return cond(condition, n, value);
-- }
-- which never terminates because it uses a call-by-value instead of a call-by-name strategy 
