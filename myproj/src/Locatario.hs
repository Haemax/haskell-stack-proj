{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Redundant bracket" #-}
module Locatario (buscaEndereco, buscaPreco) where
import Data.List.Split

buscaEndereco :: IO()
buscaEndereco = do
    putStrLn "Digite a cidade/bairro/endereco: "
    endereco <- getLine
    enderecosTxt <- readFile "Enderecos.txt"
    let linhasEnd = lines enderecosTxt
    matchStringLine endereco linhasEnd

buscaPreco :: IO()
buscaPreco = do
    putStrLn "Digite o menor preco que está disposto a pagar: "
    menPrec <- readLn :: IO Float
    putStrLn "Digite o maior preco que está disposto a pagar: "
    maiPrec <- readLn :: IO Float
    imoveisTxt <- readFile "Imoveis.txt"
    let linhasImov = lines imoveisTxt
    matchPriceRange menPrec maiPrec linhasImov

matchPriceRange :: Float -> Float -> [String] -> IO ()
matchPriceRange menPrec maiPrec [] = print "Fim da lista de Precos."
matchPriceRange menPrec maiPrec (h:t) = do
        let splitH = (splitOn "," h) !! 1 
        if (read splitH :: Float) >= menPrec && (read splitH :: Float) <= maiPrec
            then do
                print h
                matchPriceRange menPrec maiPrec t
            else
                matchPriceRange menPrec maiPrec t

matchStringLine :: String -> [String] -> IO ()
matchStringLine cmp [] = print "Fim da lista de Enderecos."
matchStringLine cmp  (h:t) = do
    if cmp `elem` splitOn "," h 
        then do
        print h
        matchStringLine cmp t
        else
        matchStringLine cmp t
     
        
    