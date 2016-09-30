module Reduction where

sumIt :: Int -> Int -> Int
sumIt x y = x + y

{--
    Lazy Reduction

    sumIt (2 + 3) 4
    (2 + 3) + 4
    5 + 4
    9


    Not lazy Reduction

    sumIt (2 + 3) 4
    sumIt 5 4
    5 + 4
    9

    Redux - выражение, которое может быть упрощено непосредственно
    sumIt (2 + 3) 4 - 2 Redux'а
--}

id x = x
const x y = x
max x y = if x <= y then y else x
infixr 0 $
f $ x = f x

const $ const (4 + 5) $ max 42

const $ const 9 $ max 42

const $ (4 + 5)

const (4 + 5)

