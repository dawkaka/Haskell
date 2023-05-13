module Catamorphic where

import Data.Array
import Data.Map qualified as Map

withdraw :: String -> Int -> Map.Map String Int -> Map.Map String Int
withdraw id amount bank = case Map.lookup id bank of
  Nothing -> bank
  Just x -> Map.insert id (x - amount) bank

bank :: Map.Map String Int
bank = withdraw "jon" 2 (Map.fromList [("jon", 100), ("doe", 200)])

arr :: Array Int String
arr = array (1, 3) [(1, "32"), (2, "10"), (3, "sds")]

arr2 = listArray (1, 10) ["dsas", "das", "dsds", "sds", "ds", "dsd", "ds", "dsd", "sdd", "ds"]

-- Array lookup
-- (!) :: Ix i => Array i e -> i -> e
-- Array update
-- (//) :: Ix i => Array i e -> [(i, e)] -> Array i e

second = arr ! 2

updatedArr2 = arr2 // [(5, "five")]

main = do
  print "x"
  print bank
  print arr
  print arr2
  print second
  print updatedArr2
