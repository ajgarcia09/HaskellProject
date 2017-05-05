{-
	Author: Ana Garcia & Cristian Ayub
	Professor: Dr. Yoonsik Cheon
	TA: Sheikh Naim
	Assignment: Project #3 - Functional Programmin Using Haskell
	Objective: To understand the concepts of
		functional programming and have a taste of it by writing a small
		Haskell program.
	Last updated: 05/04/2017
-}

import Data.Char
import Data.List
import System.IO
import System.Random
import Board

{-Reads input coordinates x and y from the user 
as a string and and converts them into integers
to make shots to the board
-} 

convertStringToInt :: String -> Int
convertStringToInt [x] = ((ord x) - (ord '0'))

{-Places ships on a board using a random x,y coordinate if
the given ship fits in the desired coordinate on the board
-}

placeShips h board = do 
	x <- randomRIO (0,9) :: IO Int
	y <- randomRIO (0,9) :: IO Int
	dir <- randomRIO (0,1) :: IO Int
	if((dir::Int) == 1)
	then 
		if(isShipPlaceable h (x::Int) (y::Int) True board)
		then return ((placeShip h (x::Int) (y::Int) True board)::Board)
		else placeShips h board
	else
		if(isShipPlaceable h (x::Int) (y::Int) False board)
		then return ((placeShip h (x::Int) (y::Int) False board)::Board)
		else placeShips h board

{-Game is played by asking the user for x and y coordinates
and checking if that spot has been hit on the board. If it
hasn't, then the board is hit until all ships are hit and sunk
-} 
play board = do
	boardToStr sqToStr board
	if isGameOver board
	then do return "Game Over"
	else do
		putStrLn ("Input X coordinate to shoot")
		coordX <- getLine
		let cx = convertStringToInt coordX
		putStrLn ("Input Y coordinate to shoot")
		coordY <- getLine
		let cy = convertStringToInt coordY
		if (isHit cx cy board) 
		then do
			putStrLn ("Error: Invalid shot.")
			play board
		else do
			let newBoard = hitBoard cx cy board
			play newBoard
	
{-Play cheat board allows the user to see the locations
on the board on which each ship is placed during the game
-}
playCheat board = do
	boardToStr sqToStrCheat board
	if isGameOver board
	then do return "Game Over"
	else do
		putStrLn ("Input X coordinate to shoot")
		coordX <- getLine
		let cx = convertStringToInt coordX
		putStrLn ("Input Y coordinate to shoot")
		coordY <- getLine
		let cy = convertStringToInt coordY
		if (isHit cx cy board) 
		then do
			putStrLn ("Error: Invalid shot.")
			play board
		else do
			let newBoard = hitBoard cx cy board
			play newBoard

{-A board game is initialized by placing ships one by one
and then starting the appropriate game mode, either regular
or cheat mode
-}
	
execute board = do
	board <- placeShips 5 board
	board <- placeShips 4 board
	board <- placeShips 3 board
	board <- placeShips 2 board
	board <- placeShips 2 board
	play board
	
executeCheat board = do
	board <- placeShips 5 board
	board <- placeShips 4 board
	board <- placeShips 3 board
	board <- placeShips 2 board
	board <- placeShips 2 board
	playCheat board