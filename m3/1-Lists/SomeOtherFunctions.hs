module SomeOtherFunctions where

import Prelude hiding (take, drop, splitAt, (!!))

take :: Int -> [a] -> [a]
take n _    | n <= 0    = []
take _ []               = []
take n (x : xs)         = x : take (n - 1) xs

drop :: Int -> [a] -> [a]
drop    n xs    | n <= 0    = xs
drop    _ []                = []
drop    n (_ : xs)          = drop (n - 1) xs

splitAt :: Int -> [a] -> ([a], [a])
splitAt n xs = (take n xs, drop n xs)

xs          !! n | n < 0    = error "negative index!"
[]          !! _            = error "out of bound"
(x : _)     !! 0            = x
(x : xs)    !! n            = xs !! (n - 1)


