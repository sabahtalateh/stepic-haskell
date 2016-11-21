module Parser where

import Data.List
import Data.Char

data Error = ParsingError | IncompleteDataError | IncorrectDataError String deriving (Show)

data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving (Show)

split' :: String -> Char -> [String]
split' [] delim  = [""]
split' (c:cs) delim
       | c == delim = "" : rest
       | otherwise  = (c : head rest) : tail rest
   where
       rest = split' cs delim

trim :: String -> String
trim = unwords . words

parseToTerms :: String -> [String]
parseToTerms ts = split' ts '\n'

splitByEq :: String -> Either Error (String, String)
splitByEq xs = if length splited >= 2 then Right (trim $ head splited, trim $ head $ tail $ splited)  else Left ParsingError where
    splited = split' xs '='

neitherToBool :: Either Error (String, String) -> Bool
neitherToBool x = case x of
    Left x  -> False
    Right x -> True

tupleFirsts :: [Either Error (String, String)] -> [String]
tupleFirsts []      = []
tupleFirsts (x:xs)  = case x of
    Right x -> fst x : tupleFirsts xs

hasAllKeys :: [String] -> Bool
hasAllKeys xs = (elem "age" xs) && (elem "firstName" xs) && (elem "lastName" xs)

splitedToList :: [Either Error (String, String)] -> [(String, String)]
splitedToList []        = []
splitedToList (x:xs)    = case x of
    Right x -> x : splitedToList xs

ageIsDigit :: [(String, String)] -> Bool
ageIsDigit xs = all isDigit (justFromMaybe (lookup "age" xs))

getAge :: [(String, String)] -> String
getAge xs = justFromMaybe (lookup "age" xs)

getFName :: [(String, String)] -> String
getFName xs = justFromMaybe (lookup "firstName" xs)

getLName :: [(String, String)] -> String
getLName xs = justFromMaybe (lookup "lastName" xs)

justFromMaybe :: Maybe a -> a
justFromMaybe (Just x) = x


parsePerson :: String -> Either Error Person
parsePerson str = let
        splited         = map splitByEq (parseToTerms str)
        splitedIsOk     = all (== True) (map neitherToBool splited)
        keys            = tupleFirsts splited
        allReqKeys      = hasAllKeys keys
        termsList       = splitedToList splited
    in
        if not splitedIsOk then
            Left ParsingError
        else if not allReqKeys then
            Left IncompleteDataError
        else if not $ ageIsDigit termsList then
            Left $ IncorrectDataError $ getAge termsList
        else
            Right Person{firstName = getFName termsList, lastName = getLName termsList, age = read (getAge termsList) :: Int}


k = parsePerson "firstName = John\nlastName = Connor\nage = 30"



