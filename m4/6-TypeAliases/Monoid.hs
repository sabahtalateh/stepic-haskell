module Monoid where

-- Моноид - множество с заданной ассоциативной бинарной операцией
-- Так же нужно чтобы был нейтральный элемент относительно операции

class Monoid a where
    mempty  :: a            -- нейтральный
    mappend :: a -> a -> a  -- операция

    mconcat :: [a] -> a
    mconcat = foldr mappend mempty

instance Monoid [a] where
    mempty  = []
    mappend = (++)

-- Числа как моноиды
newtype Sum a = Sum {getSum :: a}
    deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Sum a) where
    mempty = Sum 0
    Sum x `mappend` Sum y = Sum (x + y)

x = Sum 2 `mappend` Sum 3 -- Sum {getSum = 5}


newtype Product a = Product {getProduct :: a}
    deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Product a) where
    mempty = Product 1
    Product x `mappend` Product y = Product (x * y)

y = Product 3 `mappend` Product 4

z = Sum (getProduct $ Product 5 `mappend` Product 5) `mappend`  Sum (getSum $ Sum 4) -- Sum {getSum = 29}

newtype Xor = Xor {getXor :: Bool} deriving Show

instance Monoid Xor where
    mempty = Xor False
    (Xor True) `mappend` (Xor True) = Xor False
    (Xor False) `mappend` (Xor True) = Xor True
    (Xor True) `mappend` (Xor False) = Xor True
    (Xor False) `mappend` (Xor False) = Xor False
