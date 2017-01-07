module IO where

type IO a = RealWorld -> (RealWorld a)

return :: a -> RealWorld -> (RealWorld a)

(>>=) :: (RealWorld -> (RealWorld a))
    -> (a -> RealWorld -> (RealWorld b))
    -> RealWorld -> (RealWorld b)

instance Monad IO where

    return a    = \w -> (w, a)

    (>>=) m k   = \w -> case m w of (w', a) -> k w' a

