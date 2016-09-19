module Polimorphysm where

-- Параметрический полиморфизм. Для параметров разных типов выполоняются одни и те же действия
myid x = x

k x y = x

c4 = const 4

getSecondFrom :: t1 -> t2 -> t3 -> t2
getSecondFrom x y z = y

ff1 :: a -> a -> b -> a -> a
ff1 x1 x2 x3 x4 = x1

ff2 :: a -> a -> b -> a -> a
ff2 x1 x2 x3 x4 = x2

ff3 :: a -> a -> b -> a -> a
ff3 x1 x2 x3 x4 = x4

mono :: Char -> Char
mono x = x

-- Частичный полиморфизм
semiMono :: Char -> a -> Char
semiMono x y = x

--plus :: Integer -> Integer -> Integer
plus a b =  a + b