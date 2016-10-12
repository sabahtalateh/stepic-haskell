module Zip where

import Prelude hiding (zipWith)

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ _ [] = []
zipWith _ [] _ = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

max3 :: Ord a => [a] -> [a] -> [a] -> [a]
max3 = zipWith3 (\a b c -> max (max a b) c)

--m3 :: Ord a => a -> a -> a -> a
--m3 a b c = max (max a b) c











