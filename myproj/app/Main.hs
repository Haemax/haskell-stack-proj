module Main (main) where

import Locador
import Locatario (buscaEndereco, buscaPreco)

main :: IO ()
main = do
    buscaPreco
