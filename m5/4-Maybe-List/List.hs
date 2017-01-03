module List where

l0 = return 3 :: [Int]
l1 = [1,2] >>= (\x -> [x,x,x ])

--instance Monad [] where
--    return x = [x]
--    xs >>= k = concat $ map k xs
--    fail _ = []

list = [(x,y) | x <- [1,2,3], y <- [4,5,6]]
-- Транслируется в
list' = do
    x <- [1,2,3]
    y <- [4,5,6]
    return(x, y)
-- Точнее в
list'' =
    [1,2,3] >>= (\x ->
    [4,5,6] >>= (\y ->
    return(x,y)))

data Board = Board Int deriving Show

nextPositions :: Board -> [Board]
nextPositions (Board i) = [Board (i * 10 + 1), Board (i * 10 + 2)]

-- solution code
nextPositionsN :: Board -> Int -> (Board -> Bool) -> [Board]
nextPositionsN b n pred
  | n < 0       = []
  | n == 0      = filter pred [b]
  | otherwise   = do
    nextPositions   <- nextPositions b
    rest             <- nextPositionsN nextPositions (n-1) pred
    return rest
