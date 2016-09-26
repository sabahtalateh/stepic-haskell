module Instance where

--      Специальный полиморфизм - по классу типа
--      Контекст (Num - имя интерфейса для типа a) =>   тип выражения - a
-- 89 ::            Num         a                   =>          a

-- (+) :: Num a => a -> a -> a
-- (>) :: Ord a => a -> a -> Bool
-- (> 7) :: (Ord a, Num a) => a -> Bool
-- (> (1,2)) :: (Ord t1, Ord t, Num t1, Num t) => (t, t1) -> Bool


class Eq1 a where
    (==), (/=) :: a -> a -> Bool

instance Eq1 Bool1 where
    True    == True     = True
    False   == False    = False
    -- Все остальные случаи
    _       == _        = False

    x       /= y        = not (x == y)

-- Можно реализовать методы по умолчанию
class Eq2 a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y)

instance Eq2 Bool2 where
    True    == True     = True
    False   == False    = False
    -- Все остальные случаи
    _       == _        = False
    -- При реализации метод по умолчанию можно переопределить


-- Реализацию можно днлать циклической
class Eq2 a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y)
    x == y = not (x /= y)

-- Реализовывать можно то что хочется, нереализованное будет браться из метода по умолчанию
