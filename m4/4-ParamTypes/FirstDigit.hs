module FirstDigit where

import Data.Char(isDigit)

findDigit :: [Char] -> Maybe Char
findDigit []        = Nothing
findDigit (x:xs)    = if isDigit x then Just x else findDigit xs

findDigitOrX :: [Char] -> Char
findDigitOrX xs = print result where
    print (Just x)  = x
    print (Nothing) = 'X'
    result          = findDigit xs

maybeToList :: Maybe a -> [a]
maybeToList (Just a)    = [a]
maybeToList (Nothing)   = []

listToMaybe :: [a] -> Maybe a
listToMaybe (x:xs)  = Just x
listToMaybe []      = Nothing

