module Board where

-- Creates a board of size n*n
type Row = [Int]
mkboard :: Int -> [Row]
mkboard n = take n (repeat(take n(repeat 0)))

-- Checks all the board and determines if the game is over (v0)
{-
board :: [Row]
board = mkboard 10
isGameOver :: Int -> [Row] -> Bool
isGameOver s []			= False
isGameOver s (x:xs) 	= (s == 16) ||  if (x > 0) then (checkIfSunk (s+x) xs) else (checkIfSunk s xs)
-}

-- Checks all the board and determines if the game is over (v1)
isGameOver bd = length intact == 0 where
	intact = [p | p <- all , p > 0] where
	all = concat bd -- or all = [p | row <- bd , p <- row]
	
	








{-
0: empty
2..n: ship
-n..-2: hit
-1: miss
-}

	
	
	


	
