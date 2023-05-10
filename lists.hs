module List where 
import Data.List -- import the list module


-- list operations (functions)
-- head => returns the first element in a list
-- tail => all elements except the first one
-- init => everything except the last element
-- take n => returns the first n elements in a list
-- drop n => returns all list elements after n
-- ++  => to concatenate lists
-- !! => index access `!! 2` list element at index 2 starts from 0
-- reverse => reverses a list
-- null  => check if list is empty
-- length => returns the length of a list

arr :: [Int]
arr = [10,32,3,42,54,2,3]

r = reverse arr -- reverse a list 
s = sort arr -- sort a list `sort` is a function from the `Data.List` module 
secondElement = arr !! 2 -- !! is use to access list elements like arr[2]



main = do
    print(r)
    print(s)
    print(secondElement)