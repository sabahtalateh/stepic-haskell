module RecursivePass where

-- head элемент из головы
-- tail хвост без головы

a = head [1,2,3] -- 1
b = tail [1,2,3] -- [2,3]

second :: [a] -> a
second = head . tail


-- Сопоставлени с образцом
fst' :: (a, b) -> a
fst' ((,) x y) = x

head' :: [a] -> a
-- (:) x xs - конструктор списка состоит их головы и хвоста
head' ((:) x xs)  = x

tail' (x : xs) = xs

-- Если аргумент не используется то его можно заменить на _
tail'' (_ : xs) = xs

second' (_ : xs) = head xs

second'' (_ : x : _) = x

sndHead = snd . head





