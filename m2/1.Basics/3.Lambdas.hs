module Lambdas where

import Data.Function

-- \x -> 2 * x + 7
-- \ - это лямбда значит
a = (\x -> 2 * x + 7) 10

f x = 2 * x + 7

f' = \x -> 2 * x + 7

lenVec x y = sqrt $ x^2 + y^2
lenVec' = \x -> \y -> sqrt $ x^2 + y^2
lenVec'' = \x y -> sqrt $ x^2 + y^2

p1 = ((1, 2), (3, 4))
p2 = ((3, 4), (5, 6))

sumFst = (+) `on` helper
    where helper pp = fst $ fst pp

sumFst' = on (+) (\pp -> fst $ fst pp)

sSq = on (+) (\x -> x^2)

on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3 op f x y z = op (f x) (f y) (f z)
