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
