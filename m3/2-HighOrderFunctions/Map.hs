module Map where

import Prelude hiding (map, concat, concatMap)

-- (a -> b) - функциональный стрелочный тип
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x : xs) = f x : map f xs

leng = map length ["Hello", " ", "World"]


concat :: [[a]] -> [a]
concat []       = []
concat (xs:xss) = xs ++ concat xss

concatMap :: (a -> [b]) -> [a] -> [b]
concatMap f = concat . map f

squares'n'cubes :: Num a => [a] -> [a]
squares'n'cubes = concatMap (\x -> [x ^ 2, x ^ 3])

perms :: [n] -> [[n]]
perms [] = [[]]
perms [x] = [[x]]
perms [x,y] = [[x, y], [y, x]]

--perms (x : xs) =
--helper :: [t] -> t -> [[t]]
--helper [ ] a    = [[a]]
--helper [z] a    = [[a,z], [z, a]]
--helper xs' @ (x:xs) a = [xs'] ++ helper xs' a

tt :: [a] -> [a] -> [[a]]
--tt xs [] = [xs]
tt xs [y] = [xs ++ [y]]
tt [] ys' @ (y:ys) = [ys'] ++ tt [y] ys
tt xs' @ (x:xs) ys' @ (y:ys) = [xs' ++ ys'] ++ tt (xs' ++ [y]) (ys)
--tt [] [1,2,3]
--[[1,2,3],[1,2,3],[1,2,3]]


--- hhh []
hhh :: [a] -> [a] -> a -> [[a]]
hhh xs [] a = [xs ++ [a]]
hhh [] (y:ys) a = [a : y : ys] ++ hhh [y] ys a
hhh xs' @ (x:xs) ys' @ (y:ys) a = [xs' ++ [a] ++ ys'] ++ hhh (xs' ++ [y]) ys a
--hhh [] [1,3] 2
--[[2,1,3],[1,2,3],[1,3,2]]

--perms xs @ (x:xs') =
--  let
--    -- понижаем арность задачи
--    subPerms :: [a] -> [[a]]
--    subPerms (a : as) = map (a :) (perms as) -- leads to [[1,2,3], [1,3,2]]
--
--    -- map must do this: [1,2,3] -> [1,2,3], [2,3,1], [3,1,2]
--    walk :: Integral n => [a] -> n -> [[a]]
--    walk (l : ls) 0 = [ls ++ [l]]
--    walk (l : ls) n =
--      let ls' = ls ++ [l]
--      in [ls'] ++ (walk ls' (n - 1))
--      -- map
--  in concatMap subPerms (walk xs (length xs - 1))
----
--subPerms :: [a] -> [[a]]
--subPerms (a : as) = map (a :) (perms as) -- leads to [[1,2,3], [1,3,2]]
----
--walk :: Integral n => [a] -> n -> [[a]]
--walk (l : ls) 0 = [ls ++ [l]]
--walk (l : ls) n =
--    let ls' = ls ++ [l]
--    in [ls'] ++ (walk ls' (n - 1))

--perms :: [a] -> [[a]]
--perms x = permutations x
--
--import Data.List (delete)
--
--permutations :: Eq a => [a] -> [[a]]
--permutations [] = [[]]
--permutations xs = [ x:ys | x <- xs, ys <- permutations (delete x xs)]

