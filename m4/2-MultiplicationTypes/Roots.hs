module Roots where

rootsOld :: Double -> Double -> Double -> (Double, Double)
rootsOld a b c = (x1, x2) where
    x1 = helper (-d)
    x2 = helper d
    helper x = (-b + x) / (2 * a)
    d = sqrt discr
    discr = b ^ 2 - 4 * a * c

data Roots = Roots Double Double | None
    deriving Show

roots :: Double -> Double -> Double -> Roots
roots a b c
    | discr >= 0    = Roots x1 x2
    | otherwise     = None
    where
        x1 = helper (-d)
        x2 = helper d
        helper x = (-b + x) / (2 * a)
        d = sqrt discr
        discr = b ^ 2 - 4 * a * c

data Shape = Circle Double | Rectangle Double Double

area :: Shape -> Double
area (Circle r)         = pi * r ^ 2
area (Rectangle a b)    = a * b

data Result' = Result Int

instance Show Result' where
    show (Result n) = case n of
        0 -> "Success"
        otherwise -> "Fail: " ++ show n

doSomeWork' :: SomeData -> Result'
doSomeWork' someData = case doSomeWork someData of
    (Success, 0)    -> (Result 0)
    (Fail, n)       -> (Result n)

