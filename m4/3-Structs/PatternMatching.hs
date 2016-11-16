module PatternMatching where

data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving (Show, Eq)

p0 = Person {firstName = "Ivan", lastName = "Petrov", age = 2}

name :: Person -> String
name person = firstName person ++ " " ++ lastName person

name' :: Person -> String
name' (Person fn ln _) = fn ++ " " ++ ln

-- Синтаксис записи внутри образца
name'' :: Person -> String
name'' (Person {lastName = ln, firstName = fn}) = fn ++ " " ++ ln

abbrFirstName :: Person -> Person
abbrFirstName p@(Person {firstName = fn}) =
    if length fn <= 2 then
        p
    else
        p {firstName = head fn : "."}


