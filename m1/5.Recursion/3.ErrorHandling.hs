module ErrorHandling where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

-- error "Error!!"
-- undefined

factorial'' 0 = 1
factorial'' n = if n < 0 then error "arg must be > 0" else n * factorial' (n - 1)



