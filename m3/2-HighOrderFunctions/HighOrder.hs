module HighOrder where

import Prelude hiding (filter, takeWhile, dropWhile, span, break)

import Data.Char

filter :: (a -> Bool) -> [a] -> [a]
filter p []         = []
filter p (x : xs)
    | p x           = x : filter p xs
    | otherwise     = filter p xs

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ []          = []
takeWhile p (x : xs)
    | p x               = x : takeWhile p xs
    | otherwise         = []


dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ []              = []
-- @ - Локальный псевдоним
dropWhile p xs @ (x : xs')
    | p x                   = dropWhile p xs'
    | otherwise             = xs

span :: (a -> Bool) -> [a] -> ([a], [a])
span p xs = (takeWhile p xs, dropWhile p xs)

break :: (a -> Bool) -> [a] -> ([a], [a])
break p = span (not . p)

readDigits :: String -> (String, String)
readDigits = span isDigit


filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj p1 p2 = filter (\x -> p1 x || p2 x)

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) = smaller ++ [x] ++ bigger where
    smaller = qsort (filter (<= x) xs)
    bigger  = qsort (filter (> x) xs)











