module NotLazyOperator where

{--

    ($!) :: (a -> b) -> a -> b
    f $! x = x `seq` f x - сначала вычисляется x а потом он используется в применении f к x
    т. е. ф-я f применяется к x но при этом x вычисляется перед этим
--}

factor :: Integer -> Integer
factor n    | n >= 0    = helper 1 n
            | otherwise = error "Type >=0"
    where
        helper acc 0 = acc
        helper acc n = (helper $! (acc * n)) (n - 1)


mySum acc 0 = acc
mySum (result, ()) n = (mySum (result + n, ())) $ n - 1

goSum = mySum (0, ())