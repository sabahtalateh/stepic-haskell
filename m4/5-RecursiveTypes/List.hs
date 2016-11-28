module List where

data List a = Nil | Cons a (List a) deriving (Show)

emptyList = Nil

l0 = Cons 'z' Nil
l1 = Cons 'y' l0
l2 = Cons 'x' l1

fromList :: List a -> [a]
fromList Nil = []
fromList (Cons x xs) = x : fromList xs

toList :: [a] -> List a
toList [] = Nil
toList (x:xs) = Cons x (toList xs)

data Nat = Zero | Suc Nat deriving Show

fromNat :: Nat -> Integer
fromNat Zero = 0
fromNat (Suc n) = (fromNat n) + 1

toNat :: Integer -> Nat
toNat 0 = Zero
toNat n = Suc $ toNat $ n - 1

add :: Nat -> Nat -> Nat
add a b = toNat $ (fromNat a) + (fromNat b)

mul :: Nat -> Nat -> Nat
mul a b = toNat $ (fromNat a) * (fromNat b)

fac :: Nat -> Nat
fac n = toNat $ fac' $ fromNat n

fac' :: Integer -> Integer
fac' 0 = 1
fac' n = n * fac' (n - 1)

