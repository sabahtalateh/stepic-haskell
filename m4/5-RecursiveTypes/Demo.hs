module Demo where

data List a = Nil | Cons a (List a) deriving (Show)

emptyList = Nil

l0 = Cons 'z' Nil
l1 = Cons 'y' l0
l2 = Cons 'x' l1


