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
-- where shorten s = take n s

whatFollows :: Char -> Int -> String -> [String]
whatFollows c k string = filter (not . null) . map tail . filter match . map (take $ k + 1) $ tails  string
  where match sub = take 1 sub == [c]
-- 
z = dropWhile even [2,4,1,2,3] -- drop until it sees a non even number

findSubstring :: String -> String -> String
findSubstring chars = takeWhile (\x -> elem x chars) . dropWhile (\x -> not $ elem x chars) 

lagestNumber :: [Int] -> Either String Int
lagestNumber [] = Left "Error"
lagestNumber nums = Right $ go nums 0

go :: [Int] -> Int -> Int
go [] n = n
go (x:nums) n = go  nums (max n x)

(+++) :: String -> String -> String
a +++ b = a ++ " " ++ b

powers :: Int -> Int -> [Int]
powers k max = takeWhile  (\x -> x <= max)  (map (\x -> k^x) [0..max])

joinToLength :: Int -> [String] -> [String]
joinToLength len str = [ i++j | i <- str, j <- str, length (i ++ j) == len]


(+|+) :: [a]->[a] -> [a]
(+|+) a b = if null a then b else if null b then a else if null a && null b then [] else [head a, head b]

multiCompose :: [a -> a] -> a -> a
multiCompose [] x = x
multiCompose (f:fs) x = f (multiCompose fs x)

multiApp :: ([a] -> a) -> [a -> a] -> a -> a
multiApp f [] x = []
multiApp f gs x = f (map (\g' -> g' x) gs)


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
    print $ lagestNumber [2,4,3,2,3,2] -- Right 4
    print $ lagestNumber [] -- Left "Error"
    print [ i | i <- [1,2,3], even i]
    print [(i,j) | i <- [1,2], j <- [1,2] ] -- behaves like a nested loop
    print $ "sweet" +++ "!!"
    print (powers 2 5)
    print ([1,2,3] +|+ [4,5,6])
    print ([False] +|+ [])
    print (joinToLength  5 ["a","b","cd","def"])
    print $ multiCompose [] "foo"
    print $ multiCompose [] 1
    print $ multiCompose [(++"bar")] "foo"
    print $ multiCompose [reverse, tail, (++"bar")] "foo"
    print $ multiCompose [(3*), (2^), (+1)] 0
    print $ multiCompose [(+1), (2^), (3*)] 0
    print $ multiApp id  [(1+), (^3), (+2)] 1 
    print $ multiApp sum [(1+), (^3), (+2)] 1 
    print $ multiApp reverse [tail, take 2, reverse] "foo"
    print $ multiApp concat [take 3, reverse] "race"
    print $ multiApp id [head, (!!2), last] "axbxc"
    print $ multiApp sum [head, (!!2), last] [1,9,2,9,3]