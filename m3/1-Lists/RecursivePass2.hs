module RecursivePass2 where

import Prelude hiding (last, init, reverse)

last :: [a]     -> a
last (x : [])   = x
last (_ : xs)   = last xs

init :: [a]         -> [a]
init    []          = error "List should not be empty"
init    [_]         = []
init    (x : xs)    = x : init xs

reverse :: [a] -> [a]
reverse xs = rev xs [] where
    rev :: [a] -> [a] -> [a]
    rev [] r = r
    rev (x : xs) r = rev xs (x : r)



{-
    lst = [1,2,3,4,5] r = []
    ~> rev [2,3,4,5] (1 : [])
    ~> rev [3,4,5] (2 : (1 : []))
    ~> rev [4,5] (3 : (2 : (1 : [])))
    ~> rev [5] (4 : (3 : (2 : (1 : []))))
    ~> rev [] (5 : (4 : (3 : (2 : (1 : [])))))
-}

isPalindrome :: Eq a => [a] -> Bool
isPalindrome a = a == reverse a


