module Endless2 where

import Prelude hiding (repeat, replicate, cycle, iterate)

--repeat :: a -> [a]
--repeat x = xs where xs = x : xs

replicate :: Int -> a -> [a]
replicate n a = take n $ repeat a

cycle :: [a] -> [a]
cycle [] = error "Error!! AAA!"
cycle xs = ys where ys = xs ++ ys

iterate :: (a -> a) -> a -> [a]
iterate f x = x : (f x) : iterate f (f x)

repeat :: a -> [a]
repeat = iterate repeatHelper

repeatHelper = id


-- Генераторы списка
a = [1..10] -- раскроется в enumFromTo 1 10
b = ['a'..'z']

c = [1,3..10] -- 3 - шаг -- Раскроется в enumFromThenTo 1 3 10
d = [1..] -- бесконечный список -- enumFrom 1
e = [7,14..] -- числа кратные 7




