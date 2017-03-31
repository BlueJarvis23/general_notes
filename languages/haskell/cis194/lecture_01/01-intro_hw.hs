{-# OPTIONS_GHC -Wall #-}

-- Exercise 1

getOnes :: Integer -> [Integer]
getOnes n 
  | n <= 0      = []
  | otherwise   = ( mod n 10 ) : []

toDigits :: Integer -> [Integer]
toDigits n
  | n <= 0      = []
  | otherwise   = toDigits ( n `div` 10 ) ++ getOnes n

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0      = []
  | otherwise   = getOnes n ++ toDigits ( n `div` 10 )


-- Exercise 2

internalDoubleEven :: [Integer] -> [Integer]
internalDoubleEven []              = []
internalDoubleEven (x:[])          = [x*2]
internalDoubleEven (x:(y:zs))      = x*2 : y : internalDoubleEven zs

internalDoubleOdd :: [Integer] -> [Integer]
internalDoubleOdd []               = []
internalDoubleOdd (x:[])           = [x]
internalDoubleOdd (x:(y:zs))       = x : y*2 : internalDoubleOdd zs

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther n
  | mod (length n) 2 == 0          = internalDoubleEven n
  | mod (length n) 2 /= 0          = internalDoubleOdd n
  | otherwise                      = []

-- doubleEveryOther []              = []
-- doubleEveryOther (x:[])          = [x*2]
-- doubleEveryOther (x:(y:zs))      = x*2 : y : doubleEveryOther zs


-- Exercise 3

splitDigits :: Integer -> [Integer]
splitDigits n
  | n < 0 = []
  | n < 10 = [n]
  | otherwise = splitDigits (div n 10) ++ getOnes n

splitDigitsList :: [Integer] -> [Integer]
splitDigitsList [] = [] 
splitDigitsList (x:[]) = splitDigits x
splitDigitsList (x:xs) = splitDigits x ++ splitDigitsList xs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:[]) = x
sumDigits (x:xs) = x + sumDigits xs 


-- Exercise 4

validate :: Integer -> Bool
validate n 
  | getOnes ( sumDigits ( splitDigitsList ( doubleEveryOther ( toDigits n )))) == [0] = True
  | otherwise = False


-- Exercise 5

type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n p1 p2 p3 -- location target aux
  | n <= 0 = []
  | n == 1 = (p1, p2) : []
  | otherwise = hanoi (n-1) p1 p3 p2 ++ hanoi (1) p1 p2 p3 ++ hanoi (n-1) p3 p2 p1

