module Composition where

import Data.Function

--f :: b -> c
--g :: a -> b
--x :: a

-- \x -> f (g x) :: c

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g = \x -> f (g x)

p1 = ((1, 2), (3, 4))
p2 = ((3, 4), (5, 6))

sumFst'' = on (+) (fst . fst)

sin3 = sin . sin . sin



doItYourself = f . g . h

f :: Double -> Double
f = logBase 2

g :: Double -> Double
g = (**3)

h :: Double -> Double
h = \x -> if x > 42 then x else 42

-- a x = 22 + sin x




