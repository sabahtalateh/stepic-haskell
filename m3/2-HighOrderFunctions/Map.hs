module Map where

import Prelude hiding (map, concat, concatMap)

-- (a -> b) - функциональный стрелочный тип
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x : xs) = f x : map f xs

leng = map length ["Hello", " ", "World"]


concat :: [[a]] -> [a]
concat []       = []
concat (xs:xss) = xs ++ concat xss

concatMap :: (a -> [b]) -> [a] -> [b]
concatMap f = concat . map f

squares'n'cubes :: Num a => [a] -> [a]
squares'n'cubes = concatMap (\x -> [x ^ 2, x ^ 3])

perms :: [a] -> [[a]]
perms xs = perms' xs [] [[]]

--- Первый аргумент - список для которого надо сгенерировать перестановки (будет уменьшен до пустого списка)
--- Второй аргумент - пустой список (будет увеличиваться до списка в первом аргументе)
--- Третий - перестановки на текущем шаге
perms' :: [a] -> [a] -> [[a]] -> [[a]]
--- Терминирующее условие - если первый списо кончился возвращаем перестановки
perms' [] _ per = per
--- Первый шаг - вставляем на все вохможные места в пустом массиве первый элемент исходного списка
--- insertElementInEveryPlace [] x = [[x]]
perms' xs' @ (x : xs) [] per = perms' xs [x] (insertElementInEveryPlace [] x)
--- Шаг - для всех перестановок вида [[x,y], [y,x]] вставляем на все возможные места в каждой перестановке
--- текущий элемент (текущий это первый элемент первого списка (мы уменьшаем его в ходе выполнения))
--- и вызываем эту функцию снова для новых перестановок
perms' xs' @ (x : xs) ys' @ (y : ys) per = perms' xs (x : ys') (concatMap (\xs -> insertElementInEveryPlace xs x) per)


--- [2,3] 1 = [[1,2,3],[2,1,3],[2,3,1]]
insertElementInEveryPlace :: [a] -> a -> [[a]]
insertElementInEveryPlace = insertElementInEveryPlace' []

--- Первый аргумент (список) этой вспомогательной функции при вызове всегда пуст
--- в ходе выполнения функции элементы из второго списка перетекают
--- в первый а на каждом шаге между этими списками вставляется третий аргумент
--- insertElementInEveryPlace' [] [2,3] 1 = [[1,2,3],[2,1,3],[2,3,1]]
insertElementInEveryPlace' :: [a] -> [a] -> a -> [[a]]
-- Терминирующее условие - когда второй список кончился мы приклеиваем в конец первого списка третий аргумент
insertElementInEveryPlace' xs [] a = [xs ++ [a]]
-- Начальное состояние - первый список пуст
insertElementInEveryPlace' [] ys' @ (y:ys) a = [a : ys'] ++ insertElementInEveryPlace' [y] ys a
-- Шаг рекурсии - приклеиваем между списками третий элемент, затем уменьшаем второй список и увеличиваем первый
insertElementInEveryPlace' xs ys' @ (y:ys) a = [xs ++ [a] ++ ys'] ++ insertElementInEveryPlace' (xs ++ [y]) ys a

