module Tuples where

-- Кортежи гетерогенны (м.б. разые типы)

t = (2, True)
-- Для 2-х эл кортежей есть такие вот дела
first = fst t
second = snd t

-- (3) - не кортеж из 1 эл-та а просто 3
-- () - Пустой кортеж

dist :: (Double, Double) -> (Double, Double) -> Double
dist x1 x2 = sqrt $ ((fst x2 - fst x1) ^ 2) + ((snd x2 - snd x1) ^ 2)
