module ScanR where

import Prelude hiding (foldr, scanr)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini [] = ini
foldr f ini (x:xs) = x `f` (foldr f ini xs)


{-

foldr f ini [1,2,3] ~>> 1 `f` (2 `f` (3 `f` ini)))

??? ~>> [1 `f` (2 `f` (3 `f` ini))), 2 `f` (3 `f` ini), 3 `f` ini, ini]

-}

scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr _ ini []      = [ini]
scanr f ini (x:xs)  = (x `f` q) : qs where qs@(q:_) = scanr f ini xs

