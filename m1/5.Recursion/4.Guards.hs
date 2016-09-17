module Guards where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

-- error "Error!!"
-- undefined

factorial'' 0 = 1
factorial'' n = if n < 0 then error "arg must be > 0" else n * factorial' (n - 1)

factorial3 0 = 1
factorial3 n | n > 0 = n * factorial3 (n - 1)
             | n < 0 = error "arg must be > 0"

factorial4 n | n == 0 = 1
             | n > 0 = n * factorial4 (n - 1)
             | otherwise = error "arg must be > 0"

-- -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6  7 8 9 10
--           13 -8  5 -3  2 -1  1 0 1 1 2 3 5 8 13

fibonacci :: Integer -> Integer
fibonacci n | n == 0  = 0
            | n == 1  = 1
            | n > 1   =  fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0   = (fibonacci (-n)) * (-1) ^ ((-n) + 1)



