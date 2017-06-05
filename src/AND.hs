module AND where

import Numeric.LinearAlgebra
import AI.HNN.FF.Network

samples :: Samples Double
samples = [ (fromList [0,0], fromList [1,0])
          , (fromList [0,1], fromList [1,0])
          , (fromList [1,0], fromList [1,0])
          , (fromList [1,1], fromList [0,1]) ]

run :: IO ()
run = do
    n <- createNetwork 2 [2] 2
    mapM_ (print . output n tanh . fst) samples
    putStrLn "----------------"
    let n' = trainNTimes 1000 0.8 tanh tanh' n samples
    mapM_ (print . output n' tanh . fst) samples
