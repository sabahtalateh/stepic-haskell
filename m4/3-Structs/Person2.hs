module Person2 where

data Person = Person { fName :: String, lName :: String, age :: Int } deriving (Show, Eq)

infixl 1 &
(&) :: a -> (a -> b) -> b
x & f = f x

-- Syntax 1
john :: Person
john = Person "John" "Smith" 33

-- Syntax 2 - Порядок полей не важен, они поименованы
p0 = Person {age = 40, fName = "Ivan", lName = "Petrov"}

-- Можно создавать переменные где не все поля определены, это вызовет Warning но работать можно всё равно
unknownPetr = Person {fName = "Petr"}

unknownPetr' = Person {fName = "Petr"}

-- Exception
x = unknownPetr == unknownPetr'

-- Обновление структур person {age = 89} вернёт труктуру с изменённым возрастом
updateAge :: Int -> Person -> Person
updateAge age person = person {age = age}
