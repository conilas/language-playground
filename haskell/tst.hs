-- useless helpers
catenate snd fst = fst ++ snd
catenateYou      = catenate ", you"
catenateYouOpt   = Just . catenateYou

-- same as fmap but infix
-- remember: Functor are simply mappers from one cat to another
-- in hask case, they are the same, so we have an Endofunctor
-- it maps object: va E Hask \exists Fa E Hask
-- and arrows. arrows are from fmap - like this function invokes!
functor :: Functor f => f [Char] -> f [Char]
functor a = catenateYou <$> a

-- calling the applicative star
-- remember: an Applicative is just a lax monoidal functor
-- a lax monoidal functor has two isomorphisms:
-- a :: 1h -> F 1h
-- e :: F([X,Y]) -> ([FX, FY])
-- in this case, the star is doing
-- map :: f (a -> b) -> Fa -> Fb
-- so, a functor holding a function and applying it to the functor outside
applicative   :: Maybe String -> Maybe String
applicative a = Just catenateYou <*> a

-- calling the kleisli arrow
-- remember: the monad is the easiest
-- it is just a Kleisli triple (F, n, e) where n, e are natural transformations and 
-- where n :: T2 -> T (join)
-- where e :: 1 -> T  (unit)
-- in this case, the kleisli arrow is just acting as n; 
-- the unit would be the constructor of the datatype Just
monad   :: Maybe String -> Maybe String
monad a = a >>= catenateYouOpt

-- just to show some point free notation
do_all :: Maybe String -> Maybe String
do_all = applicative . functor . monad

prod_applicative a = (" hey ", (++"")) <*> a

-- fun thing about the applicative for the product type:
-- it has to be a monoid on the argument 
-- so we could describe its type like
-- Monoid a => Applicative ((,) a)
product_applicative = prod_applicative .  functor


-- the io applicative is the most interesting so far
-- see, it can simply throw out a value with the then function (>>) 
-- say: if we try to do let a = create_io "useless" >> create_io "new",
-- out a will be at the end a IO [Char] being "new" only, and the useless
-- string turns out to be in fact useless. 
-- it is easy to see how this can be of use for an IO of Unit (IO ()), because 
-- it allows to chain operations for it. 
-- Like putStr :: [Char] -> IO (). You can chain many of them and the only thing they
-- compute is the side-effect of outputting a String. 
-- IO is cool and easy to understand after a while
create_io  :: [Char] -> IO [Char] 
create_io a = return a

create_number_from_string :: [Char] -> Int
create_number_from_string _ = 10

create_applicative_from_function :: Applicative a => ([Char] -> Int) -> a ([Char] -> Int)
create_applicative_from_function = pure 

io_applicative a fn = let applicative_holder = create_applicative_from_function fn in
			let applicative_value = create_io a in
			    applicative_holder <*> applicative_value				

test = Just 1 <|> Just 'a'
