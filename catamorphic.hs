module Catamorphic where
import Data.List

addThree :: Int -> Int
addThree x = x + 3

doTwice :: (a -> a) -> a -> a
doTwice f x = f (f x)

t = doTwice addThree 3 -- addThree (addThree(3))  ==> addThree (6)  ==> 9

v = map addThree [1,2,3]


--partial application
divide :: Double -> Double -> Double
divide a b = b / a

q = map (divide 2) [10,20,30,40,50] -- makes sense
d = map (/2) [10,20,30,40,50] -- operators

f = filter (\x -> not (null x)) [[22],[],[3]]

-- the . and $ operators
a = reverse (map head (map reverse (["Haskell","pro"] ++ ["dodo","lyric"])))
-- reverse (map head (map reverse (["Haskell","pro", "dodo","lyric"])))
-- reverse (map head (["lleksaH", "orp", "odod","ciryl"]))
-- reverse (['l', 'o', 'o', 'c'])
-- ""
b = reverse . map head . map reverse $ ["Haskell","pro","dodo","lyric"]

addOne x = x + 1

r = addOne . addThree $ 3

-- substringsOfLength :: Int -> String -> [String]
-- substringsOfLength n string = map shorten (tails string)
--   where shorten s = take n s

whatFollows :: Char -> Int -> String -> [String]
whatFollows c k string = filter (not . null) . map tail . filter match . map (take $ k + 1) $ tails  string
  where match sub = take 1 sub == [c]
-- 
z = dropWhile even [2,4,1,2,3] -- drop until it sees a non even number

findSubstring :: String -> String -> String
findSubstring chars = takeWhile (\x -> elem x chars) . dropWhile (\x -> not $ elem x chars) 

main = do
    print v -- [4 5 6]
    print t -- 9
    print q -- [5.0, 10.0,15.0, 20.0,50.0]
    print f
    print a
    print b 
    print r
    print (whatFollows 'a' 2 "abracadabra")
    print z -- [1,2,3]
    print $ findSubstring "a" "bbaabaaaab" 