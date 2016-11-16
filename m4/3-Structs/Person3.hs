
data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving (Show, Eq)

per1 = Person {firstName = "Ivan", lastName = "Petrov", age = 2}
per2 = Person {firstName = "Petr", lastName = "Ivanov", age = 222}

updateLastName :: Person -> Person -> Person
updateLastName p1 p2 = p2 {lastName = lastName p1}


