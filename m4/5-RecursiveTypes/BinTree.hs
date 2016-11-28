module BinTree where

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

getLeft :: Tree a -> Tree a
getLeft (Node x _) = x

getRight :: Tree a -> Tree a
getRight (Node _ x) = x

tree1 = Node (Node (Leaf 3) (Leaf 3)) (Leaf 3)
--tree1 = Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)
tree2 = Node (Node (Leaf (3 :: Int) ) (Leaf (30 :: Int) )) (Leaf  (3 :: Int))


height :: Tree a -> Int
height (Leaf _) = 0
height (Node x y) = maximum[1 + height x, 1 + height y]

size :: Tree a -> Int
size (Leaf _) = 1
size (Node x y) = 1 + size x + size y

avg :: Tree Int -> Int
avg t =
    let (c,s) = go t
    in s `div` c
  where
    go :: Tree Int -> (Int, Int)
    go (Leaf l) = (1, l)
    go (Node x y) = tupleSum (go x) (go y) where
        tupleSum :: (Int, Int) -> (Int, Int) -> (Int, Int)
        tupleSum (a, b) (c, d) = (a + c, b + d)




