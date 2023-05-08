module Collatz where


step ::Int -> Int
step n = if even n then down else up
         where down =  div n 2
               up = n * 3 + 1

collatz::Int -> Int
collatz 1 = 0
collatz n = 1 + collatz(step n)

longest::Int -> Int
longest n = long 0 0 n

long::Int -> Int -> Int -> Int
long number _ 0 = number
long number max n = 
    if len > max 
    then long n len (n-1)
    else long number max (n - 1)
    where len = collatz(n)

main = do 
    print (longest 3)