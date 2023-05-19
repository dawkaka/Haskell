module Main where

import Control.Applicative (Applicative (liftA2))

fruits :: [String]
fruits = ["apple", "orange", "bread"]

bunch = liftA2 copy [1, 2, 3] fruits
  where
    copy n s = unwords (replicate n s)

main :: IO ()
main = do
    print bunch