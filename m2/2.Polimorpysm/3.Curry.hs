module SpecialPolymorphysm where

--      Специальный полиморфизм - по классу типа
--      Контекст (Num - имя интерфейса для типа a) =>   тип выражения - a
-- 89 ::            Num         a                   =>          a

-- (+) :: Num a => a -> a -> a
-- (>) :: Ord a => a -> a -> Bool
-- (> 7) :: (Ord a, Num a) => a -> Bool
-- (> (1,2)) :: (Ord t1, Ord t, Num t1, Num t) => (t, t1) -> Bool


class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
