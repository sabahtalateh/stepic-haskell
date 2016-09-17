module LetIn where

-- a0 = 1; a1 = 2; a2 = 3; a3 = 3; a4 = 2; ak+3 = ak+2 + ak+1 − 2ak;
seqA :: Integer -> Integer
seqA n
    | n == 0        = 1
    | n == 1        = 2
    | n == 2        = 3
    | otherwise     =
        let
            helper aK aKplus1 aKplus2 k limit
                | k == limit        = aKplus2 + aKplus1 - 2 * aK
                | otherwise         =
                    let
                        aKplus3 = aKplus2 + aKplus1 - 2 * aK
                    in helper aKplus1 aKplus2 aKplus3 (k + 1) limit
            in helper 0 1 2 2 n


roots :: Double -> Double -> Double
        -> (Double, Double)

roots a b c =
    (
        (-b - sqrt (b ^ 2 - 4 * a * c)) / (2 * a),
        (-b + sqrt (b ^ 2 - 4 * a * c)) / (2 * a)
    )


roots' a b c =
    let d = sqrt (b ^ 2 - 4 * a * c) in
    (
        (-b - d) / (2 * a),
        (-b + d) / (2 * a)
    )

roots'' a b c =
    let {d = sqrt (b ^ 2 - 4 * a * c); x1 = (-b - d) / (2 * a); x2 = (-b + d) / (2 * a)}
    in (x1, x2)

-- Можно обьявить aTwice после того как он будет применён
roots''' a b c =
    let
        d = sqrt $ b ^ 2 - 4 * a * c
        x1 = (-b - d) / aTwice
        x2 = (-b + d) / aTwice
        aTwice = 2 * a
    in (x1, x2)

-- Можно локально связать списочек переменных
-- Это типо связывание по образцу
rootsDiff a b c =
    let
        (x1, x2) = roots a b c
    in x2 - x1

-- Можно локально связать функцию
factorial :: Integer -> Integer
factorial n
    | n >= 0     =
        let
            helper :: Integer -> Integer -> Integer
            helper acc 0 = acc
            helper acc n = helper (acc * n) (n - 1)
        in helper 1 n

    | otherwise  = error "arg must be >= 0"






