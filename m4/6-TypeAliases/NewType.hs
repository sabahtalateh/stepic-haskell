module NewType where

-- newtype - Обёртка над существующим типом с единственным конструктором у которого 1 параметр

-- Пропадают все представители для упакованного типа, нет Show,
-- например для реализации интерфейсов
newtype IntList = IList [Int] deriving Show

example = IList [1,2]

data IntList' = IList' [Int] deriving Show

-- Тип через newtype имеет 1 конструктор с 1 параметром
-- Тип через newtype более ленив чем через data


ignore' :: IntList' -> String
ignore' (IList' _) = "Hello"
-- Тут будет error
a = ignore' undefined

ignore :: IntList -> String
ignore (IList _) = "Hello"
-- Тут всё будет ок, не будет сопоставления с образцом так как конструктор всего ОДИН
b = ignore undefined

newtype Identity a = Identity {runIdentity :: a} deriving (Eq, Ord)

--newtype A = A a
--newtype A a b = A a b
--newtype A = A A A
--newtype A a = A
--newtype A = A
--newtype A = A A +
--newtype A a = A a +
--newtype A a b = A a
--newtype A a = A a a
--newtype A a b = A b +
