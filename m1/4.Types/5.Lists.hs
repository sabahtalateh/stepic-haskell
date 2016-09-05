module Lists where

-- Списки гомогенны, Кортежи гетерогенны
a = [1,2,3]

b = ['H', 'i']

c = "Hi"

-- b и c одно и то же
-- [Char] = String

d = "Hi" :: String

-- Операции со списками : - добавить в голову
e = 'H' : "ello"

-- Конкатенация списков

f = e ++ " world"

