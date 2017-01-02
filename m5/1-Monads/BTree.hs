module BTree where

import Data.Functor

data Tree a = Leaf a | Branch (Tree a) a (Tree a) deriving Show

testTree = Branch (Leaf 2) 3 (Leaf 4)

instance Functor Tree where
    fmap g (Leaf x)         = Leaf (g x)
    fmap g (Branch l x r)   = Branch (fmap g l) (g x) (fmap g r)

-- Есть алиас для fmap - <$> в модуле Data.Functor
newTree = (^2) <$> testTree

newTree2 = (+1) <$> (+1) <$> testTree

-- <$ - затирает все значения в контейнерах
newTree3 = 44 <$ testTree

