module Odd where

data Odd = Odd Integer deriving (Eq,Show)


instance Enum Odd where
    fromEnum (Odd x) = fromIntegral x

    toEnum x
        | x `mod` 2 /= 0    = Odd $ toInteger x
        | otherwise         = error "Odd cannot be even"

    succ (Odd x)            = Odd $ x + 2

    pred (Odd x)            = Odd $ x - 2

    enumFrom (Odd x)        = (Odd x) : enumFrom (succ (Odd x))

    enumFromThen (Odd x) (Odd y) = (Odd x) : enumFromThen (Odd y) (Odd (y + (y - x)))

    enumFromTo (Odd x) (Odd y)
        | x > y = []
        | otherwise = (Odd x) : enumFromTo (succ $ Odd x) (Odd y)

    enumFromThenTo (Odd x) (Odd y) (Odd z)
        | x > z  && x  <  y = []
        | x < z  && x  >  y = []
        | x >= z && x  >= y = (Odd x) : enumFromThenTo (Odd y) (Odd (y - (x - y))) (Odd z)
        | x <= z && x  <= y = (Odd x) : enumFromThenTo (Odd y) (Odd (y + (y - x))) (Odd z)

--    enumFromThenTo (Odd x) (Odd y) (Odd z) =

--instance Enum Odd where
--    succ (Odd x) = Odd (x+2)
--    pred (Odd x) = Odd (x-2)
--    toEnum m | m `mod` 2 /= 0 = Odd (toInteger m)
--             | otherwise      = error "Odd parameter cannot be even"
--    fromEnum (Odd m) = fromIntegral m
--    enumFrom x = x : enumFrom (succ x)
--    enumFromThen x@(Odd n) y@(Odd m) = x : enumFromThen y (Odd (m+m-n))
--    enumFromTo x@(Odd n) y@(Odd m) | n > m     = []
--                                   | otherwise = x : enumFromTo (succ x) y
--    enumFromThenTo x@(Odd n) y@(Odd m) z@(Odd k) | n > k && m-n > 0   = []
--                                                 | n < k && m-n < 0   = []
--                                                 | n <= k && m-n > 0  = x : enumFromThenTo y (Odd (m+(m-n))) z
--                                                 | otherwise = x : enumFromThenTo y (Odd (m-(n-m))) z







