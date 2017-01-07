module Reader2 where

import System.Directory
import Data.List
import System.IO

newtype Reader r a = Reader { runReader :: (r -> a) }

-- запускает Reader в окружении r и возвращает значение a
-- Передаётся Reader - r a и окружение r и возвращается значение a
-- runReader :: r a -> r -> a


instance Monad (Reader r) where
    return x = Reader $ \e -> x
    m >>= k = Reader $ \e ->
        let v = runReader m e
        in runReader (k v) e

ask :: Reader r r
ask = Reader id

-- Применяет функцию к окружению
asks :: (r -> a) -> Reader r a
asks = Reader

ex1 = runReader ask 42

type User = String
type Password = String
type UsersTable = [(User,Password)]

pwds :: UsersTable
pwds = [("Bill","123456"),("Ann","qwerty"),("John","2sRqf78P")]

-- возвращает имя первого пользователя в списке
firstUser :: Reader UsersTable String
firstUser = do
  e <- ask
  let name = fst (head e)
  return name

user = runReader firstUser pwds

--firstUserPwd :: Reader UsersTable Password
firstUserPwd = asks (snd . head)

fupwd = runReader firstUserPwd pwds

usersCount :: Reader UsersTable Int
usersCount = asks length

local :: (r -> r) -> Reader r a -> Reader r a
local f m = Reader $ \e -> runReader m (f e)

local' :: (r -> r') -> Reader r' a -> Reader r a
local' f m = Reader $ \e -> runReader m (f e)

ll = local (("Mike", "123"):) usersCount

usersWithBadPasswords :: Reader UsersTable [User]
usersWithBadPasswords = do
    asks $ (map fst) . (filter (\(_,pwd) -> pwd == "123456"))

localTest = do
    count1 <- usersCount
    count2 <- local (("Mike", "123"):) usersCount
    return (count1, count2)

ex2 = runReader localTest pwds

reader :: (r -> a) -> Reader r a
reader f = do
    r <- ask
    return $ f r






