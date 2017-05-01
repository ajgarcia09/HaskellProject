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
isGameOver s []            = False
isGameOver s (x:xs)     = (s == 16) ||  if (x > 0) then (checkIfSunk (s+x) xs) else (checkIfSunk s xs)
-}

-- Checks all the board and determines if the game is over (v1)
isGameOver bd = length intact == 0 where
    intact = [p | p <- all , p > 0] where
    all = concat bd -- or all = [p | row <- bd , p <- row]


{-   Can a ship of size n be placed at the square (x,y) of the given
     board? X and y are 1-based column and row indices of the start
     square, and dir denotes the direction (True for horizontal and
     False for vertical).

   

    
-}
--isShipPlaceable n x y dir board =



{-   Place a ship of size n at the square (x,y) of the given board
     horizontally or vertically. A new board is returned.
    
     First, call isShipPlaceable. If False, return.
     Else if  isShipPlaceable returned True and direction
     is horizontal, "iterate" through the board placing
     n in the each of the n spots to the right
     of board[x][y].
    
     Example: placeShip 3 2 2 True board

     isShipPlaceable returned True.
     Go to board[2,2] and update the index with n= 3
     Update the next n indices with n
     board[2][3] = 3
     board[2][4] = 3
     return the board

     x 1 2 3 4 5 6 7 8 9 0
     y --------------------
     1| . . . . . . . . . .
     2| . 3 3 3 . . . . . .
     3| . . . . . . . . . .
     4| . . . . . . . . 4 .
     5| . . . . . . . . 4 .
     6| . . . . . . . . 4 .
     7| . . . . . . . . 4 .
     8| . . . . . . . . . .
     9| . . . . . . . . . .
     0| . . . . . . . . . .

     else if  direction is vertical, "iterate" through
     list placing n in the each of the n spots below
     board[x][y].

     Example: placeShip 4 4 9 False board
     isShipPlaceable returned True.
     Go to board[4][9] and update the index with n=4
     Update the next n indices below board[4][9] with n
     board[5][9] = 4
     board[6][9] = 4
     board[7][9] = 4
     return the board

-}

--placeShip n x y dir board

--Checks whether a place (x,y) has been hit on a board
{- Index into board[x][y]. If element at board[x][y]
    is equal to -2 or -1, return True.Return false otherwise

-}
isHit x y board
    |shot == hit = True
    |shot == miss = True
    |otherwise = False
    where shot = board !!x !!y
          hit = -2
          miss = -1

{-Hit the square at the position (x,y) of the given board, where x
     and y are 1-based column and row indices. A new board is
     returned.
 
    Index into board[x][y]. If board[x][y] is equal to -1 or -2,
    return, because this spot has already been hit. Otherwise,
    if board[x][y] is equal to 0, mark this spot with a -1 (a miss)
    If board[x][y] is equal to another number (2,3,4,5) mark it
    with a -2 (a hit on a ship).
    Return the board.

-}   

hitBoard x y board
    --call isHit and proceed only if false
    |spot == 0 = markMiss
    |spot > 0 = markHit
    otherwise = "Invalid board position"
    where spot = board !!x!!y
          miss =     
          hit = 







{-
0: empty
2..n: ship
-n..-2: hit
-1: miss
-}

	
	
	


	
