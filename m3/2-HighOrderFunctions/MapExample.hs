module MapExample where

import Prelude hiding (and, or, all, any)

import Data.Char

and, or :: [Bool] -> Bool

and []          = True
and (x : xs)    = x && and xs

or []           = False
or (x : xs)     = x || or xs

all :: (a -> Bool) -> [a] -> Bool
all p = and . map p

any :: (a -> Bool) -> [a] -> Bool
any p = or . map p


revWords = unwords . map reverse . words

string = "Abc is not ABC"
rev = revWords string

delAllUpper :: String -> String
delAllUpper str =
    unwords . remUpper $ words str where
        remUpper [] = []
        remUpper (x : xs)
            | all isUpper x = remUpper xs
            | otherwise = x : remUpper xs










