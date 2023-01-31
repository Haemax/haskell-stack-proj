{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use head" #-}
module Locatario (buscaId, buscaEndereco, buscaPreco, buscaData, criarReserva) where
import Data.List.Split

buscaId :: Int -> IO()
buscaId id = do
    imoveisTxt <- readFile "Imoveis.txt"
    let linhasImov = lines imoveisTxt
    matchId id linhasImov

buscaEndereco :: IO()
buscaEndereco = do
    putStrLn "Digite a cidade/bairro/endereco: "
    endereco <- getLine
    enderecosTxt <- readFile "Enderecos.txt"
    let linhasEnd = lines enderecosTxt
    matchStringLine endereco linhasEnd

buscaPreco :: IO()
buscaPreco = do
    putStrLn "Digite o menor preço que está disposto a pagar: "
    menPrec <- readLn :: IO Float
    putStrLn "Digite o maior preço que está disposto a pagar: "
    maiPrec <- readLn :: IO Float
    imoveisTxt <- readFile "Imoveis.txt"
    let linhasImov = lines imoveisTxt
    matchPriceRange menPrec maiPrec linhasImov

buscaData :: IO ()
buscaData = do
    putStrLn "Digite o dia do mês pretendido para a reserva: "
    dia <- readLn :: IO Int
    putStrLn "Digite o mês pretendido para a reserva: "
    mes <- readLn :: IO Int
    reservasTxt <- readFile "Reservas.txt"
    let linhasReserv = lines reservasTxt
    checkDate dia mes linhasReserv

criarReserva :: IO ()
criarReserva = do
  putStrLn "Id do imóvel a ser reservado: "
  idImovel <- readLn :: IO Integer
  putStrLn "Dia da reserva: "
  dia <- readLn :: IO Integer
  putStrLn "Mês da reserva: "
  mes <- readLn :: IO Integer

  salvarReserva idImovel dia mes
  putStrLn "Reserva feita."

salvarReserva :: Integer -> Integer -> Integer -> IO ()
salvarReserva idImovel dia mes = do
    let reserva = show idImovel ++ "," ++ show dia ++ "," ++ show mes ++ "\n"
    appendFile "Reservas.txt" reserva

checkDate :: Int -> Int -> [String] -> IO ()
checkDate dia mes [] = putStrLn "Fim da lista de imóveis vagos no dia."
checkDate dia mes (h:t) = do
    let splitId  = (splitOn "," h) !! 0
    let splitDia = (splitOn "," h) !! 1
    let splitMes = (splitOn "," h) !! 2
    if (read splitDia :: Int) /= dia && (read splitMes :: Int) /= mes
        then do
            buscaId (read splitId :: Int) 
            checkDate dia mes t
        else
            checkDate dia mes t

matchId :: Int -> [String] -> IO ()
matchId id [] = putStrLn "Fim da lista de Ids."
matchId id (h:t) = do
    let splitH = head (splitOn "," h)
    if (read splitH :: Int) == id
         then do
            putStrLn h
        else
            matchId id t

matchPriceRange :: Float -> Float -> [String] -> IO ()
matchPriceRange menPrec maiPrec [] = putStrLn "Fim da lista de preços."
matchPriceRange menPrec maiPrec (h:t) = do
        let splitH = (splitOn "," h) !! 1 
        if (read splitH :: Float) >= menPrec && (read splitH :: Float) <= maiPrec
            then do
                putStrLn h
                matchPriceRange menPrec maiPrec t
            else
                matchPriceRange menPrec maiPrec t

matchStringLine :: String -> [String] -> IO ()
matchStringLine cmp [] = putStrLn "Fim da lista de endereços."
matchStringLine cmp  (h:t) = do
    if cmp `elem` splitOn "," h 
        then do
        putStrLn h
        matchStringLine cmp t
        else
        matchStringLine cmp t
     
        
    