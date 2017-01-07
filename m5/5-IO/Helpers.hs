module Helpers where

import Control.Monad

putStr' :: String -> IO ()
putStr' (x:xs) = putChar x >> putStr' xs
putStr' [] = return ()

{-
sequence_ :: Monad m => [m a] -> m ()
sequence_ xs = foldr (>>) (return ()) xs
-}

ex1 = sequence_ [[1,2], [1,2,3]] -- будет 8 () пустых значений потому что sequence_ не производит вычислений

putStr'' :: String -> IO ()
putStr'' xs = sequence_ $ map putChar xs

{-
mapM_ :: (a -> m b) -> [m a] -> m ()
mapM_ f = sequence_ . map f
-}

{-
sequence :: [m a] -> m [a]
sequence xs = foldr k (return []) xs where
    k :: m a -> m [a] -> m [a]
    k m m' = do
        x  <- m
        xs <- m'
        return (x:xs)

mapM :: (a -> m b) -> [a] -> m [b]
mapM f = sequence . map f
-}

ex2 = sequence [Just 1, Nothing] -- будет Nothing
ex3 = sequence [Just 1, Just 2] -- будет Just [1,2]
ex4 = sequence [getLine, getLine]