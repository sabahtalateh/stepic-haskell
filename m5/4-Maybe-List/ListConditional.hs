module ListConditional where

lst = [(x,y) | x <- [1,2,3], y <- [1,2], x /= y]

lst' = do
    x <- [1,2,3]
    y <- [1,2]
    True <- return(x /= y)
    return(x,y)

lst'' =
    [1,2,3]         >>= (\x ->
    [1,2]           >>= (\y ->
    return(x /= y)  >>= (\b ->
    case b of True  -> return (x,y)
              _     -> fail "..."
  )))

lst''' = do
    x <- [1,2,3]
    y <- [1,2]
    if (x /= y) then "Z" else []
    return(x,y)

pythagoreanTriple :: Int -> [(Int, Int, Int)]
pythagoreanTriple x
    | x <= 0    = []
    | otherwise = do
        a <- [1..x]
        b <- [1..x]
        c <- [1..x]
        if ((a^2 + b^21 == c^2) && (a < b)) then [1] else []
        return (a,b,c)

