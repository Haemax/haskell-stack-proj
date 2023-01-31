{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use head" #-}
module Locador (
    cadastrarImovel,
    salvarImovel,
    salvarEndereco,
    listarImoveis
) where
import Data.List.Split

-- Coloca um apartamento como disponível para alugar
cadastrarImovel :: IO ()
cadastrarImovel = do
  putStrLn "ID do imóvel: "
  idImovel <- readLn :: IO Integer
  putStrLn "Valor da diária: "
  diaria <- readLn :: IO Double
  putStrLn "Telefone para contato: "
  telefone <- getLine
  putStrLn "CPF: "
  cpf <- getLine
  putStrLn "Tipo do imóvel: "
  tipo <- getLine
  putStrLn "Quantidade de quartos: "
  quartos <- readLn :: IO Integer
  putStrLn "Quantidade de quartos com suíte: "
  quartosSuite <- readLn :: IO Integer
  putStrLn "Quantidade de banheiros: "
  banheiros <- readLn :: IO Integer
  putStrLn "Quantidade de vagas de garagens: "
  garagens <- readLn :: IO Integer
  putStrLn "Limite de hóspedes: "
  hospedes <- readLn :: IO Integer
  putStrLn "Tem wi-fi? "
  wifi <- getLine
  putStrLn "Tem piscina? "
  piscina <- getLine
  putStrLn "Aceita animais? "
  animais <- getLine

  salvarImovel idImovel diaria telefone cpf tipo quartos quartosSuite banheiros garagens hospedes wifi piscina animais
  cadastrarEndereco idImovel
  putStrLn "Imóvel cadastrado."

cadastrarEndereco :: Integer -> IO ()
cadastrarEndereco idImovel = do
    putStrLn "CEP: "
    cep <- getLine
    putStrLn "Rua: "
    rua <- getLine
    putStrLn "Número: "
    numero <- getLine
    putStrLn "Complemento: "
    complemento <- getLine
    putStrLn "Bairro: "
    bairro <- getLine
    putStrLn "Cidade: "
    cidade <- getLine
    putStrLn "Estado: "
    estado <- getLine

    salvarEndereco idImovel cep rua numero complemento bairro cidade estado

salvarImovel :: Integer -> Double -> String -> String -> String -> Integer -> Integer -> Integer -> Integer -> Integer -> String -> String -> String -> IO ()
salvarImovel idImovel diaria telefone cpf tipo quartos quartosSuite banheiros garagens hospedes wifi piscina animais = do
    let imovel = show idImovel ++ "," ++ show diaria ++ "," ++ telefone ++ "," ++ cpf ++ "," ++ tipo ++ "," ++ show quartos ++ "," ++ show quartosSuite ++ "," ++ show banheiros ++ "," ++ show garagens ++ "," ++ show hospedes ++ "," ++ wifi ++ "," ++ piscina ++ "," ++ animais ++ "\n" 
    appendFile "Imoveis.txt" imovel

salvarEndereco :: Integer -> String -> String -> String -> String -> String -> String -> String -> IO ()
salvarEndereco idImovel cep rua numero complemento bairro cidade estado = do
    let endereco = show idImovel ++ "," ++ cep ++ "," ++ rua ++ "," ++ numero ++ "," ++ complemento ++ "," ++ bairro ++ "," ++ cidade ++ "," ++ estado ++ "\n"
    appendFile "Enderecos.txt" endereco

listarImoveis :: IO ()
listarImoveis = do
    putStrLn "Imóveis cadastrados no sistema: "
    imoveisTxt <- readFile "Imoveis.txt"
    let imoveis = lines imoveisTxt
    if null imoveis then putStrLn "Não há imóveis cadastrados."
    else mostraImovel imoveis

mostraImovel :: [String] -> IO ()
mostraImovel [] = print "Fim da lista de imóveis"
mostraImovel (h:t) = do
    let imovel = splitOn "," h
    putStrLn ("Id do imóvel: " ++ show (imovel!!0))