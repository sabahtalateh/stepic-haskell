module SumSquarePosElems where

sumPosSquares :: [Integer] -> Integer
sumPosSquares = foldr (\x s -> if x > 0 then x^2 + s else s) 0

sumPosSquares' :: [Integer] -> Integer
sumPosSquares' = foldr f 0 where
    f x s | x > 0     = x^2 + s
          | otherwise = s

sumSq = sumPosSquares [2,2,-100]

lengthList :: [a] -> Int
lengthList = foldr (\x s -> s + 1) 0

sumOdd :: [Integer] -> Integer
sumOdd = foldr (\x s -> if x `mod` 2 /= 0 then x + s else s) 0
