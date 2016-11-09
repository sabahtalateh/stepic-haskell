module Example where

{-
    foldr f ini 1:2:3:[] ~>> (1 `f` (2 `f` (3 `f` ini)))

    foldl

    (((ini `f` 1) `f` 2) `f` 3)
    f(f(f ini 1) 2) 3

    foldl :: (b -> a -> b) -> b -> [a] -> b
-}
