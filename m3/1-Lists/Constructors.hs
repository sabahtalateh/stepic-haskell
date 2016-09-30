module Constructors where

a = []      -- Empty list
b = 3 : a


nTimes :: a -> Integer -> [a]
nTimes el times = helper el times 0 [] where

    helper :: a -> Integer -> Integer -> [a] -> [a]
    helper el times count list
        | count >= times    = list
        | otherwise         = helper el times (count + 1) (el : list)
