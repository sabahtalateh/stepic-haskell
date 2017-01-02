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
        ("Alice", "Mary")
    ]

getM, getF :: Name -> Maybe Name
getM person = lookup person mothers
getF person = lookup person fathers

billsGrandGrandMotherByFatherLine0 = getF "Bill" >>= getM >>= getM

billsGrandGrandMotherByFatherLine1 = do
    let name = "Bill"
    f   <- getF name
    gm  <- getM f
    ggm <- getM gm
    return ggm

billsGrandGrandMotherByFatherLine2 = do {f <- getF "Bill"; gm <- getM f; getM gm}

-- Ищем бабушек
granmas :: Name -> Maybe (Name, Name)
granmas person = do
    m   <- getM person
    gmm <- getM m
    f   <- getF person
    gmf <- getM f
    return (gmm, gmf)

billGMs = granmas "Bill"
-- Хоть у John и есть 1 бабушка но всё равно Nothing
johnGMs = granmas "John"





