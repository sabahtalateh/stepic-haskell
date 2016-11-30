module Demo where

import Data.Char
import qualified Data.Map as Map

-- type String = [Char]

allUpper :: String -> Bool
allUpper = all isUpper


type IntegerList = [Integer]

sumSquares :: IntegerList -> Integer
sumSquares = foldr1 (+) . map (^2)

xs = [1,2,3] :: IntegerList
ys = [1,2,3] :: [Integer]
-- Хотя формально типы разные на самом деле одинаковые
isEq = xs == ys

-- Типы можно параметризовывать
type AssocList k v = [(k, v)]


lookup' :: Eq k => k -> AssocList k v -> Maybe v
lookup' _ []            = Nothing
lookup' key ((k, v):list)
    | k == key          = Just v
    | otherwise         = lookup' key list

x = lookup' 1 ([(3,3), (2,2), (1,1)] :: AssocList Int Int)

-- Можно частично применять
type IntMap = Map.Map Int

type Endo a = a -> a

ttt :: (Int -> Int) -> (Int -> Int)
ttt = undefined
