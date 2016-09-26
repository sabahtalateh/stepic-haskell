module PolymorphInstance where

-- Реализацию можно днлать циклической
class Eq2 a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y)
    x == y = not (x /= y)

instance Eq2 Bool2 where
    True    == True     = True
    False   == False    = False
    -- Все остальные случаи
    _       == _        = False
    -- При реализации метод по умолчанию можно переопределить


instance (Eq a, Eq b) => Eq (a, b) where
    p1 == p2 = (fst p1 == fst p2) && (snd p1 == snd p2)

