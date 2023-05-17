module Main where

import Data.Maybe (fromMaybe)

login :: String -> Maybe String
login "dawkaka" = Just "Yussif Mohammed"
login "jon" = Just "Amadu Hamza"
login _ = Nothing

secrete :: String -> Maybe String
secrete "Yussif Mohammed" = Just "panda"
secrete _ = Nothing

revealSecrete :: String -> Maybe String
revealSecrete password = case login password of
    Nothing -> Nothing
    Just v -> case secrete v of
        Nothing -> Nothing
        Just v -> Just ("Stole a screte: " ++ v)

-- with chaining operator
(?>) :: Maybe a -> (a -> Maybe a) -> Maybe a
(?>) Nothing _ = Nothing
(?>) (Just v) f = f v

revealWithChain :: String -> Maybe String
revealWithChain password =
    login password
        ?> secrete
        ?> decorate
  where
    decorate s = Just ("Stole secret: " ++ s)

main = do
    print "hello"
    print $ revealSecrete "dawkaka"