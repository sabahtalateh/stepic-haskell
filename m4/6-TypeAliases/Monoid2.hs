module Monoid2 where

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



instance (Monoid a, Monoid b) => Monoid (a, b) where
    mempty = (mempty, mempty)
    (x1, x2) `mappend` (y1, y2) = (x1 `mappend` y1, x2 `mappend` y2)

ex1 = ("ABC", Product 2) `mappend` ("DEF", Product 3)

instance Monoid a => Monoid (Maybe a) where
    mempty = Nothing
    Nothing `mappend` m = m
    m `mappend` Nothing = m
    (Just a) `mappend` (Just b) = Just $ a `mappend` b

-- First - возвращает первый не нулевой элемент
newtype First a = First {getFirst :: Maybe a}
    deriving (Eq, Ord, Read, Show)

instance Monoid (First a) where
    mempty                      = First $ Nothing
    First Nothing `mappend` r   = r
    l `mappend` _               = l

ex2 = mconcat [First Nothing, First (Just 3), First (Just 5)]
firstConcat = getFirst . mconcat . map First
ex3 = firstConcat [Nothing, Just 3, Just 5]


newtype Maybe' a = Maybe' { getMaybe :: Maybe a }
    deriving (Eq,Show)

instance Monoid a => Monoid (Maybe' a) where
  mempty                            = Maybe' $ Just mempty
  mappend a @ (Maybe' Nothing) _    = a
  mappend _ a @ (Maybe' Nothing)    = a
  mappend (Maybe' a) (Maybe' b)     = Maybe' (a)

a = mempty :: Maybe' (Sum Integer)
b = Maybe' (Just (Sum 3))
c = Maybe' (Just (Sum 4))

e = Maybe' Nothing
































