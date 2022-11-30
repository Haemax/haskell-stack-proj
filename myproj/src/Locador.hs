module Locador (
    Imovel(..),
    Endereco(..),
    Agenda(..),
    cadastrarImovel,
    salvarImovel,
    salvarEndereco,
    criarReserva,
    listarImoveis
) where

-- Tipo do imovel, com os atributos: Valor da diaria (Double), Numero de telefone para contato (String), 
-- Tipo de imóvel (String), Quantidade de quartos (Integer), Quantidade de quartos com suíte (Integer), 
-- Quantidade de banheiros (Integer), Número de vagas de garagem (Integer), Limite de hóspedes (Integer), 
-- Se tem wifi (Bool), Se tem piscina (Bool), Se aceita animais (Bool), Endereço (Endereco).
data Imovel = Imovel
  { idImovel :: Integer,
    valorDiaria :: Double,
    telefoneContato :: String,
    tipoImovel :: String,
    quantQuartos :: Integer,
    quantQuartosSuite :: Integer,
    quantBanheiros :: Integer,
    quantGaragem :: Integer,
    quantHospedes :: Integer,
    temWifi :: String,
    temPiscina :: String,
    aceitaAnimais :: String,
    endereco :: Endereco
  }
  deriving (Eq, Show)

-- Tipo do endereço
data Endereco = Endereco
  { cep :: String,
    rua :: String,
    numero :: String,
    complemento :: String,
    bairro :: String,
    cidade :: String,
    estado :: String
  }
  deriving (Eq, Show)

-- Tipo da agenda de reservas
data Agenda = Agenda
  { idApto :: String,
    dia :: Integer,
    mes :: Integer,
    reservado :: Bool
  }
  deriving (Eq, Show)

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

-- Tipo do imovel, com os atributos: ID do imóvel (Integer), Valor da diaria (Double), Número de telefone para contato (String), 
-- Tipo de imóvel (String), Quantidade de quartos (Integer), Quantidade de quartos com suíte (Integer), 
-- Quantidade de banheiros (Integer), Número de vagas de garagem (Integer), Limite de hóspedes (Integer), 
-- Se tem wifi (String), Se tem piscina (String), Se aceita animais (String).
salvarImovel :: Integer -> Double -> String -> String -> String -> Integer -> Integer -> Integer -> Integer -> Integer -> String -> String -> String -> IO ()
salvarImovel idImovel diaria telefone cpf tipo quartos quartosSuite banheiros garagens hospedes wifi piscina animais = do
    let imovel = show idImovel ++ "," ++ show diaria ++ "," ++ telefone ++ "," ++ cpf ++ "," ++ tipo ++ "," ++ show quartos ++ "," ++ show quartosSuite ++ "," ++ show banheiros ++ "," ++ show garagens ++ "," ++ show hospedes ++ "," ++ wifi ++ "," ++ piscina ++ "," ++ animais ++ "\n" 
    appendFile "Imoveis.txt" imovel

salvarEndereco :: Integer -> String -> String -> String -> String -> String -> String -> String -> IO ()
salvarEndereco idImovel cep rua numero complemento bairro cidade estado = do
    let endereco = show idImovel ++ "," ++ cep ++ "," ++ rua ++ "," ++ numero ++ "," ++ complemento ++ "," ++ bairro ++ "," ++ cidade ++ "," ++ estado ++ "\n"
    appendFile "Enderecos.txt" endereco

salvarReserva :: Integer -> Integer -> Integer -> IO ()
salvarReserva idImovel dia mes = do
    let reserva = show idImovel ++ "," ++ show dia ++ "," ++ show mes ++ "\n"
    appendFile "Reservas.txt" reserva

listarImoveis :: IO ()
listarImoveis = do
    putStrLn "Imóveis cadastrados no sistema: "
    imoveisTxt <- readFile "Imoveis.txt"
    let imoveis = lines imoveisTxt
    mostraImovel imoveis

mostraImovel :: [String] -> IO ()
mostraImovel (h:t) = do
    --let imovel = splitOn "," h
    --putStrLn "Id do imóvel: " ++ show (imovel!!0)
    putStrLn "Mostrar imóvel"