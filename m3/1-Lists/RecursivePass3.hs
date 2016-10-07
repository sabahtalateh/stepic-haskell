module RecursivePass3 where

import Prelude hiding (zip, zip3, unzip)

zip ::  [a] ->  [b]   -> [(a, b)]
zip     []      _     =  []
zip     as      []    =  []
zip     (a : as) (b : bs) = (a, b) : zip as bs


zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
zip3 (a:as) (b:bs) (c:cs) = (a,b,c) : zip3 as bs cs
zip3 _ _ _ = []


unzip :: [(a, b)] -> ([a], [b])
unzip [] = ([], [])
unzip ((x, y) : xys) =
    let (xs, ys) = unzip xys
    in (x : xs, y : ys)

-- unzip [(1,2), (3,4), (5,6), (7,8)]
-- unzip (1,2) : [(3,4), (5,6), (7,8)]

uu :: [(a)] -> ([a])
uu [] = ([])
uu (x : xs) =
    let (xxs) = uu xs
    in (x : xxs)




sum2 :: Num a => [a] -> [a] -> [a]
sum2 (x : xs) (y : ys) = x + y : sum2 xs ys
sum2 (x : xs) [] = x : sum2 xs []
sum2 [] (x : xs) = x : sum2 xs []
sum2 [] [] = []

sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 xs ys zs = sum2 (sum2 xs ys) zs


groupElems :: Eq a => [a] -> [[a]]
groupElems xs = accum (reverse xs) [] where
    accum :: Eq a => [a] -> [[a]] -> [[a]]
    accum (x : xs) [] = accum xs ([x] : [])
    accum (x : xs) acc
        | (head $ head acc) == x    = accum xs ([x : head acc] ++ tail acc)
        | otherwise                 = accum xs ([x] : acc)
    accum [] acc = acc











































