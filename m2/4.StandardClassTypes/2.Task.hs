module Task where

class KnownToGork a where
    stomp :: a -> a
    doesEnrageGork :: a -> Bool

class KnownToMork a where
    stab :: a -> a
    doesEnrageMork :: a -> Bool

class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
    stompOrStab         :: a -> a
    stompOrStab a       | doesEnrageGork a && doesEnrageMork a = stomp (stab a)
                        | doesEnrageGork a = stab a
                        | doesEnrageMork a = stomp a
                        | otherwise = a



