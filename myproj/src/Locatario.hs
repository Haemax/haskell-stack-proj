{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use head" #-}
module Locatario (buscaId, buscaEndereco, buscaPreco, buscaData) where
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

--cancelaReserva :: IO ()
--cancelaReserva = do 
   -- putStrLn "Digite o ID do imovel reservado: "
  --  idImov <- readLn :: IO Int
  --  reservasTxt <- readFile "Reservas.txt"
-- let linhasReserv = lines reservasTxt
    --checkReserv idImov linhasReserv

--checkReserv :: Int -> [String] -> IO ()
--checkReserv idImov [] = print "Reserva cancelada."
--checkReserv idImov (h:t) = do
  --  let splitH = head (splitOn "," h)
   -- if (read splitH :: Int) == idImov
   --      then do
  --          h = ""
    --    else
     --       checkReserv id t

checkDate :: Int -> Int -> [String] -> IO ()
checkDate dia mes [] = print "Fim da lista de imoveis vagos no dia."
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
matchId id [] = print "Fim da lista de Id's."
matchId id (h:t) = do
    let splitH = head (splitOn "," h)
    if (read splitH :: Int) == id
         then do
            print h
        else
            matchId id t

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
     
        
    