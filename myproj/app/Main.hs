module Main (main) where

import Locador 
import Locatario
import Locatario (buscaData)

main :: IO ()
main = do
    buscaData
