module Folding where

import Prelude hiding (foldr)

sumList :: [Integer] -> Integer
sumList []      = 0
sumList (x:xs)  = x + sumList xs

productList :: [Integer] -> Integer
productList []      = 1
productList (x:xs)  = x * productList xs

concatList :: [[x]] -> [x]
concatList = foldr (++) []
--concatList [] = []
--concatList (x:xs) = x ++ concatList xs


foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini []      = ini
foldr f ini (x:xs)  = x `f` foldr f ini xs

sumList' :: [Integer] -> Integer
sumList' = foldr (+) 0