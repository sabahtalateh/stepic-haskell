module Maybe where

-- Монады реализуются только для однопараметрических типов

--import Prelude hiding (Maybe, Just, Nothing)
--
--data Maybe a = Just a | Nothing deriving (Eq, Show)
--
--instance Monad Maybe where
--    return      = Just
--
--    (Just x)    >>= k = k x
--    Nothing    >>= k = Nothing
--
--    (Just _)    >>  m = m
--    Nothing     >>  _ = Nothing
--
--    fail _      = Nothing

type Name = String
type Database = [(Name, Name)]

fathers, mothers :: Database
fathers = [
        ("Bill", "John"),
        ("Ann", "John"),
        ("John", "Piter")
    ]
mothers = [
        ("Bill", "Jane"),
        ("Ann", "Jane"),
        ("John", "Alice"),
        ("Jane", "Dorothy"),
        ("Alice", "Maary")
    ]

getM, getF :: Name -> Maybe Name
getM person = lookup person mothers
getF person = lookup person fathers

