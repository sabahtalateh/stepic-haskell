module CustomOperators where

{-
Символы для определения кастомных опреаторов
! # $ % * + . / < = > ? @ \  ^ | - ~
-}

-- Сумма квадратов. Левоассоциативный оператор с приоритетом 6
infixl 6 *+*

(*+*) a b = a ^ 2 + b ^ 2

c = (2 *+* 3) *+* 4

-- Модуль разности переданных аргументов

infixl 6 |-|
a |-| b = if a - b >= 0 then a - b else -(a - b)













