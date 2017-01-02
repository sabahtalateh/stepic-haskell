module Lexer where

import Data.Char

data Token = Number Int | Plus | Minus | LeftBrace | RightBrace    
    deriving (Eq, Show)

asToken :: String -> Maybe Token
asToken x = if all isDigit x
    then Just (Number (read x :: Int))
    else if x == "+" then Just Plus
    else if x == "-" then Just Minus
    else if x == "(" then Just LeftBrace
    else if x == ")" then Just RightBrace
    else Nothing

tokenize :: String -> Maybe [Token]
tokenize = sequence . (map asToken) . words

