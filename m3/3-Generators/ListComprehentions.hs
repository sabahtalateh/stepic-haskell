module ListComprehentions where

xs = [1..20]

sqrs = [x^2 | x <- xs]

-- Можно накладывать условия
sqrslt200 = [x^2 | x <- xs, x^2 < 200]

-- Генераторы могут сложными
z = [(x,y) | x <- [1,2], y <- [1,2]]

-- Пифагоровы тройки без повторений
pif3 = [(x,y,z) | x <- [1..20], y <- [1..20], z <- [1..20], x^2 + y^2 == z^2, x <= y]


coins = [2,3,7]

--change :: (Ord a, Num a) => a -> [[a]]
change 0 = [[]]
change n = [x | x <- (genNTimes (arrCount coins)), arrSum x == n]

change' 0 = [[]]
change' n = [coin:ch | coin <- coins, ch <- change' $ n - 1]

hhh 0 = [[]]
hhh n = (change' n) : hhh (n - 1)

genNTimes n = concat $ hhh n

arrSum [] = 0
arrSum (x:xs) = x + arrSum xs

arrCount [] = 0
arrCount (x:xs) = 1 + arrCount xs

--change 0 = [[]]
--change s = [coin:ch | coin <- coins, coin <= s, ch <- (change $ s - coin)]





