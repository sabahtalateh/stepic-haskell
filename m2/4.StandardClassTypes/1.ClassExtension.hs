module ClassExtension where

class Eq a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y)
    x == y = not (x /= y)

class (Eq a) => Ord a where
    (<), (>), (<=), (=>) :: a -> a -> Bool
    max, min :: a -> a -> a
    compare :: a -> a -> Ordering

-- Миниммальная реаизация Ord - compare | <=

class (Eq a, Printable a) => MyClass a where
    ...




