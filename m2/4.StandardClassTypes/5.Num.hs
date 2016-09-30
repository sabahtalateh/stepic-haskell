module Num where

--class Num a where
--    (+), (-), (*)   :: a -> a -> a
--    negate          :: a -> a
--    abs             :: a -> a
--    signum          :: a -> a
--    fromInteger     :: Integer -> a
--
--    x - y           = x + negate y
--    negate x        = 0 - x

{-
LAW     abs x * signum x == x
-}

-- class Integral - целочисленное деление
-- class Fractional - деление с плавающей точкой

avg :: Int -> Int -> Int -> Double
avg a b c = sum / 3 where
    sum = fromInteger (
            (toInteger a) +
            (toInteger b) +
            (toInteger c)
        )
