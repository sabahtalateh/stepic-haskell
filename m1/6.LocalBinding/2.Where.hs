module Where where

sum'n'count :: Integer -> (Integer, Int)
sum'n'count x = (summ, len) where
    number       = if x < 0 then (-x) else x
    digits :: [Integer]
    digits  = extractDigitsTenBase number []
    summ    = sum digits
    len     = length digits


extractDigits :: Integer -> [Integer] -> Integer -> [Integer]
extractDigits x digits base
        | remainder == 0        = digits ++ [x]
        | otherwise             = extractDigits remainder (digits ++ [prefix]) base
    where
        remainder = div x base
        prefix = mod x base

extractDigitsTenBase x digits = extractDigits x digits 10





-- Можно обьявить aTwice после того как он будет применён
--roots''' a b c =
--    let
--        d = sqrt $ b ^ 2 - 4 * a * c
--        x1 = (-b - d) / aTwice
--        x2 = (-b + d) / aTwice
--        aTwice = 2 * a
--    in (x1, x2)
--
---- let x = 2 in x^2 - выражение, его можно использовать в других выражениях (let x = 2 in x^2)^2
---- where это не выражение, оно может использоваться в определении функции только в определённом месте
--
--roots'''' a b c = (x1, x2) where
--    d = sqrt $ b ^ 2 - 4 * a * c
--    x1 = (-b - d) / aTwice
--    x2 = (-b + d) / aTwice
--    aTwice = 2 * a
--
--factorial :: Integer -> Integer
--factorial n
--        | n >= 0     = helper 1 n
--        | otherwise  = error "arg must be >= 0"
--    where
--        helper :: Integer -> Integer -> Integer
--        helper acc 0 = acc
--        helper acc n = helper (acc * n) (n - 1)



