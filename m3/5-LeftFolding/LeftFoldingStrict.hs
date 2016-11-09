module LeftFoldingStrict where

import Prelude hiding (foldl)

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini []      = ini
foldl f ini (x:xs)  = foldl f ini' xs
    where ini' = (f ini x)

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f ini []     = ini
foldl' f ini (x:xs)  = ini' `seq` foldl' f ini' xs
    where ini' = (f ini x)


{-

foldl f ini 1:2:3:[]
foldl f (f ini 1) (2:3:[])
foldl f (f (f ini 1) 2) (3:[])
foldl f (f (f (f ini 1) 2) 3) []
f (f (f (f ini 1) 2) 3)

-}


