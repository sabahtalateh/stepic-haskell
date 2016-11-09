module Unfold where

unfold :: (b -> (a,b)) -> b -> [a]
unfold f ini =
    let (x, ini') = f ini in
        x : unfold f ini'


iterate' f = unfold (\x -> (x,f x))
