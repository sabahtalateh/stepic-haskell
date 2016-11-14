module Basics where

--import Prelude hiding (Bool, True, False)

--data Bool = True | False
--
--alwayTrue :: Int -> Bool
--alwayTrue n = True

{-
    Функции над типом данных определяются при помощи сопоставления с образцом
-}

data B = T | F deriving (Show, Eq, Read, Enum)

not' :: B -> B
not' T = F
--not' F = T

-- :set -fwarn-incomplete-patterns - включает и отлючает предупреждения о частичном определении
-- :unset -fwarn-incomplete-patterns

charToInt :: Char -> Int
charToInt '0' = 0
charToInt '1' = 1
charToInt '2' = 2
charToInt '3' = 3
charToInt '4' = 4
charToInt '5' = 5
charToInt '6' = 6
charToInt '7' = 7
charToInt '8' = 8
charToInt '9' = 9

data Color = Red | Green | Blue deriving Show

stringToColor :: String -> Color
stringToColor "Red" = Red
stringToColor "Green" = Green
stringToColor "Blue" = Blue

emptyOrSingleton :: Bool -> a -> [a]
emptyOrSingleton False _ = []
emptyOrSingleton True x = []

isEqual :: (Eq a, Eq b) => (a, b) -> (a, b) -> Bool
isEqual (a, b) (a', b') = True


data LogLevel = Error | Warning | Info

cmp :: LogLevel -> LogLevel -> Ordering
cmp Error Error     = EQ
cmp Info Info       = EQ
cmp Warning Warning = EQ
cmp Error _         = GT
cmp _ Error         = LT
cmp Info _          = LT
cmp _ Info          = GT


lessThenError :: LogLevel -> Bool
lessThenError level =
    case cmp level Error of
        LT  -> True
        _   -> False

data Result = Fail | Success

--processData :: SomeData -> String
--processData d = case  doSomeWork d of
--    (_,0) -> "Success"
--    (_,n) -> "Fail: " ++ show n






























