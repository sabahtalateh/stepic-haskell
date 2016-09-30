module Modules where

-- Неявно импортируется Prelude
-- hiding прячет, т.е. не импортрует
import Data.Char hiding (toUpper, toLower)

import Data.List

-- qualified - все ф-ии из модуля должны использоваться с указанием модуля т.е. Data.Set.union
-- так же можно задавать алиас и вызывать как Set.union
import qualified Data.Set as Set

-- Если надо переопределить что то из Prelude то мы пишем import Prelude hiding (то что надо переопределить)

-- Шаги компиляции
-- 1. Синтаксичесая проверка
-- 2. Проверка типов
-- 3. Язык core
-- 4. Оптимизация
-- 5. Кодогенерация
-- 6. STG машина (Графовая редукция)
-- 7. C--
-- 8. бинарничок

addTwoElements :: a -> a -> [a] -> [a]
addTwoElements a b t = (:) a $ (:) b $ t
