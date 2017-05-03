module Main where

import System.IO
import System.Random
import Board

-- main :: IO ()
-- main = do
	-- number <- randomRIO (1,10) :: IO Int
	-- number1 <- randomRIO (1,10) :: IO Int
	-- putStrLn ("Your random number X is: " ++ show number)
	-- putStrLn ("Your random number Y is: " ++ show number1)
	
placeShips :: [Int] -> [Row] -> [Row]
placeShips [] board = [[]]
placeShips (h:t) board
	| (isShipPlaceable h x y dir board) = placeShip h x y dir board : placeShips t x y dir board
	| otherwise = placeShips ships board where
        x <- randomRIO (0,9) :: IO Int
        y <- randomRIO (0,9) :: IO Int
        ships = h ++ t
		
getX = do
       putStrLn "Enter a positive X value?"
       line <- getLine
       let parsed = reads line :: [(Integer, String)] in
         if length parsed == 0
         then getX'
         else let (x, _) = head parsed in
           if x > 0 
           then return x
           else getX'
       where
         getX' = do
           putStrLn "Invalid input!"
           getX
		   
getY = do
       putStrLn "Enter a positive Y value?"
       line <- getLine
       let parsed = reads line :: [(Integer, String)] in
         if length parsed == 0
         then getY'
         else let (y, _) = head parsed in
           if y > 0 
           then return y
           else getY'
       where
         getY' = do
           putStrLn "Invalid input!"
           getY