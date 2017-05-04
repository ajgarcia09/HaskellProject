import System.IO
import System.Random
import Board

-- main :: IO ()
-- main = do
	-- number <- randomRIO (1,10) :: IO Int
	-- number1 <- randomRIO (1,10) :: IO Int
	-- putStrLn ("Your random number X is: " ++ show number)
	-- putStrLn ("Your random number Y is: " ++ show number1)

-- x :: IO Int
-- y :: IO Int
-- placeShips :: [Int] -> [[Int]] -> IO [[Int]]
-- placeShips [] board = [[]]
-- placeShips (h:t) board
	-- | (isShipPlaceable h x y dir board) = placeShip h x y dir board : placeShips t x y dir board
	-- | otherwise = placeShips ships board where
        -- x <- randomRIO (0,9) :: IO Int
        -- y <- randomRIO (0,9) :: IO Int
        -- ships = h ++ t

placeShips :: [Int] -> [[Int]] -> IO [[Int]]
placeShips (h:t) board = do 
	x <- randomRIO (0,9) :: IO Int
	y <- randomRIO (0,9) :: IO Int
	-- d <- randomRIO (0,1) :: IO Int
	if (isShipPlaceable h x y dir board) 
	then placeShip h x y dir board 
	else if (isShipPlaceable 0 x y dir board) then return board
	else placeShips ships board where
		ships = [h] ++ t
		dir = False
		
-- getX prompt = do
       -- putStrLn ("Enter a positive" ++ prompt ++ "value?")   
       -- line <- getLine
       -- let parsed = reads line :: [(Integer, String)] in
         -- if length parsed == 0
         -- then getX'
         -- else let (x, _) = head parsed in
           -- if x > 0 
           -- then return x
           -- else getX'
       -- where
         -- getX' = do
           -- putStrLn "Invalid input!"
           -- getX