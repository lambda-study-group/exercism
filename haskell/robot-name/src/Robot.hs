module Robot (Robot, initialState, mkRobot, resetName, robotName) where

import Control.Monad.State
  ( MonadState (get, put),
    MonadTrans (lift),
    StateT,
  )
import Data.IORef (IORef, newIORef, readIORef, writeIORef)
import Data.List (delete)
import System.Random (randomRIO)
import Text.Printf (printf)

newtype Robot = Robot {name :: IORef String}

newtype RunState = RunState [String]

initialState :: RunState
initialState = RunState []

mkRobot :: StateT RunState IO Robot
mkRobot = do
  RunState nn <- get
  n <- lift $ genNewRandomName nn
  put $ RunState $ n : nn
  n' <- lift $ newIORef n
  return $ Robot n'

resetName :: Robot -> StateT RunState IO ()
resetName robot = do
  RunState nn' <- get
  oldName <- lift $ readIORef $ name robot
  let nn = delete oldName nn'
  n <- lift $ genNewRandomName nn
  put $ RunState $ n : nn
  lift $ writeIORef (name robot) n

robotName :: Robot -> IO String
robotName robot = do
  readIORef $ name robot

genNewRandomName :: [String] -> IO String
genNewRandomName nn = do
  n <- genRandomName
  if n `elem` nn
    then genNewRandomName nn
    else return n

genRandomName :: IO String
genRandomName = do
  c1 <- randomRIO ('A', 'Z')
  c2 <- randomRIO ('A', 'Z')
  n <- randomRIO (0, 999) :: IO Int
  return $ printf "%c%c%03d" c1 c2 n
