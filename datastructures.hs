module Catamorphic where

import qualified Data.Map as Map
import Data.Array

withdraw :: String -> Int -> Map.Map String Int -> Map.Map String Int
withdraw id amount bank = case Map.lookup id bank of 
                                            Nothing -> bank
                                            Just x -> Map.insert id (x - amount) bank

bank = withdraw "jon" 2 (Map.fromList [("jon", 100), ("doe", 200)])

arr = array (1,3) [(1,"32"),(2, "10"),(3,"sds")]
arr2 = listArray (1,10)["dsas","das","dsds","sds","ds","dsd","ds","dsd","sdd","ds"]

-- Array lookup
-- (!) :: Ix i => Array i e -> i -> e
-- Array update
-- (//) :: Ix i => Array i e -> [(i, e)] -> Array i e

second = arr ! 2
updatedArr2 = arr2 // [(5,"five")]

main = do
    print "x"
    print bank
    print arr
    print arr2
    print second
    print updatedArr2
    print ws