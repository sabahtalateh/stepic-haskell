module LeftFolding where

import Prelude hiding (foldl)

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini []      = ini
foldl f ini (x:xs)  = foldl f (f ini x) xs

{-

foldl f ini 1:2:3:[]
foldl f (f ini 1) (2:3:[])
foldl f (f (f ini 1) 2) (3:[])
foldl f (f (f (f ini 1) 2) 3) []
f (f (f (f ini 1) 2) 3)

-}


