module MayBTree where

import Data.Functor

data Tree a = Leaf (Maybe a) | Branch (Tree a) (Maybe a) (Tree a) deriving Show

instance Functor Tree where
    fmap g (Leaf x)         = foo g x where
        foo g (Just a)      = Leaf . Just $ g a
        foo g Nothing       = Leaf Nothing

    fmap g (Branch l x r)   = Branch (fmap g l) (foo x) (fmap g r) where
        foo x = case x of
            Nothing -> Nothing
            Just x  -> Just (g x)


test1 = Leaf Nothing
test2 = words <$> Leaf (Just "a b")
