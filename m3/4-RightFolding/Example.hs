module Example where

import Prelude hiding (foldr)

xx  = foldr (-) 5 [1,2,3]
xx' = foldl (-) 5 [1,2,3]
{-
будет
(1 - (2 - (3 - 5)))
-}

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini []      = ini
foldr f ini (x:xs)  = x `f` foldr f ini xs


{-

foldr f ini 1:2:3:[]
~> 1 `f` foldr f ini (2:3:[])
~> 1 `f` (2 `f` foldr f ini (3:[]))
~> 1 `f` (2 `f` (3 `f` foldr f ini []))
~> 1 `f` (2 `f` (3 `f` ini))

-}
