module Maybe where

{-
  Тип данных Maybe содержит 2 конструктора
  $ :t Nothing
  $ :t Just

  Maybe содержит либо ни одного либо один элемент
-}

import Data.List

x0 = find odd [2,4,6,7,9]
x1 = lookup 'c' [('a', 1), ('b', 2), ('c', 3), ('d', 4)]

unfoldr' :: (b -> Maybe (a, b)) -> b -> [a]
unfoldr' f ini = helper (f ini) where
    helper (Just (x, ini')) = x : unfoldr' f ini'
    helper Nothing          = []

evensUpTo10 = unfoldr' (\x -> if x >= 10 then Nothing else Just (x, x+2)) 0

revRange :: (Char,Char) -> [Char]
revRange (end, start)
    | start < end = []
    | otherwise = unfoldr (g end) start
        where g end = (\x -> if x == pred end then Nothing else Just (x, pred x))



