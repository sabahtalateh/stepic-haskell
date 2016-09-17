module Accumulators where

factorial n | n >= 0     = helperF 1 n
            | otherwise  = error "arg must be >= 0"


helperF :: Integer -> Integer -> Integer
helperF acc 0 = acc
helperF acc n = helperF (acc * n) (n - 1)

-- -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6  7 8 9 10
--           13 -8  5 -3  2 -1  1 0 1 1 2 3 5 8 13

oldFibonacci :: Integer -> Integer
oldFibonacci n | n == 0  = 0
            | n == 1  = 1
            | n > 1   =  oldFibonacci (n - 1) + oldFibonacci (n - 2)
            | n < 0   = (oldFibonacci (-n)) * (-1) ^ ((-n) + 1)


fibonacci :: Integer -> Integer
fibonacci n | n == 0    = 0
            | n == 1    = 1
            | n > 1     = helper 2 n 0 1
            | n < 0     = (fibonacci (-n)) * (-1) ^ ((-n) + 1)

helper :: Integer -> Integer -> Integer -> Integer -> Integer
helper count maxCount n'1 n'2 | count == maxCount   = n'1 + n'2
                              | otherwise           = helper (count + 1) maxCount n'2 (n'1 + n'2)