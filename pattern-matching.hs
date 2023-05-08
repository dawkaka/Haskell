module Greet where

greet :: String -> String -> String
greet "Spain" name = "Hola " ++ name
greet "China" name = "Ni hao " ++ name
greet _ name = "Hello " ++ name

-- the order matters
-- putting line 6 first makes line 4 and 5 redundant
-- the `_` is like the `*` wildcard

main = do
    print(greet "Spain" "Dawkaka")
    print(greet "Ghana" "Dawkaka")

