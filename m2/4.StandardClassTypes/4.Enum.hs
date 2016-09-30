module Enum where

-- класс Enum позволяет нам итерироваться по типу
--class Enum a where
--    succ, pred  :: a -> a
--    toEnum      :: Int -> a
--    fromEnum    :: a -> Int

a = succ 4

b = pred 'c'

cNum = fromEnum 'c'

-- Класс Bounded тип с огрничением
--class Bounded a where
--    minBound, maxBound :: a

maxInt = maxBound :: Int


class (Enum a, Bounded a, Eq a) => SafeEnum a where
  ssucc     :: a -> a
  ssucc a   = if a == maxBound then minBound else succ a

  spred     :: a -> a
  spred a   = if a == minBound then maxBound else pred a

--instance SafeEnum Bool

instance SafeEnum Int



