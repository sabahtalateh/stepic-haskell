module Person where

data Person' = Person' String String Int

fName' :: Person' -> String
fName' (Person' x _ _) = x

lName' :: Person' -> String
lName' (Person' _ x _) = x

age' :: Person' -> Int
age' (Person' _ _ x) = x

data Person = Person { fName :: String, lName :: String, age :: Int } deriving (Show, Eq)

john :: Person
john = Person "John" "Smith" 33


infixl 1 &

(&) :: a -> (a -> b) -> b
x & f = f x

johnAge = john & age

