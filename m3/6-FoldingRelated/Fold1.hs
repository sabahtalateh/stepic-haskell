module Fold1 where

import Prelude hiding (foldr1, foldl1)

foldr1 :: (a -> a -> a) -> [a] -> a
foldr1 _ [x]        = x
foldr1 f (x:xs)     = f x (foldr1 f xs)
foldr1 _ []         = error "foldr1: Empty list"

foldl1 :: (a -> a -> a) -> [a] -> a
foldl1 f (x:xs) = foldl f x xs
foldl1 _ []     = error "foldl1: Empty list"

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

max' :: (Ord a) => [a]  -> a
max' []                 = error "max' Empty list"
max' [x]                = x
max' (x : xs)           = max x (max' xs)

lastElem' :: [a]    -> a
lastElem' []        = error "lastElem: Empty list"
lastElem' [x]       = x
lastElem' xs        = lastElem' (tail xs)

lastElem :: [a] -> a
lastElem xs = foldl1 (flip const) xs


--lastElem :: [a] -> a
--lastElem xs = foldl1 tail xs

