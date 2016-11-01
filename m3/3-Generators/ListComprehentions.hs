module ListComprehentions where

xs = [1..20]

sqrs = [x^2 | x <- xs]

-- Можно накладывать условия
sqrslt200 = [x^2 | x <- xs, x^2 < 200]

-- Генераторы могут сложными
z = [(x,y) | x <- [1,2], y <- [1,2]]

-- Пифагоровы тройки без повторений
pif3 = [(x,y,z) | x <- [1..20], y <- [1..20], z <- [1..20], x^2 + y^2 == z^2, x <= y]


coins :: (Ord a, Num a) => [a]
coins = [2,3]

change :: (Ord a, Num a) => a -> [[a]]
change s
    | s == 0    = [[]]
    | otherwise = [coin:ch | coin <- coins, coin <= s, ch <- (change  $ s - coin)]





