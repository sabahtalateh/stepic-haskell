module Printable where

class Printable a where
    toString :: a -> String

instance Printable Bool where
    toString True   = "true"
    toString _      = "false"

instance Printable () where
    toString _      = "unit type"

instance (Printable a, Printable b) => Printable (a, b) where
    toString p = "(" ++ a ++ "," ++ b ++ ")" where
        a = toString $ fst p
        b = toString $ snd p

