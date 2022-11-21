module Locador (
    Apartamento(..),
    Endereco(..),
    Agenda(..),
    cadastrarImovel,
    criarReserva
) where

-- Tipo do apartamento, com os atributos: Valor da diaria (Double), Numero de telefone para contato (String), Tipo de imóvel (String), Quantidade de quartos (Integer), Quantidade de quartos com suíte (Integer), Quantidade de banheiros (Integer), Número de vagas de garagem (Integer), Limite de hóspedes (Integer), Se tem wifi (Bool), Se tem piscina (Bool), Se aceita animais (Bool), Endereço (Endereco).
data Apartamento = Apartamento
  { valorDiaria :: Double,
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
  putStrLn "Valor da diária: "
  diaria <- readLn :: IO Double
  putStrLn "Telefone para contato: "
  telefone <- getLine
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

  let endereco = Endereco cep rua numero complemento bairro cidade estado
  let apto = Apartamento diaria telefone tipo quartos quartosSuite banheiros garagens hospedes wifi piscina animais endereco
  putStrLn "Imóvel cadastrado."

criarReserva :: IO ()
criarReserva = do
  putStrLn "Id do apartamento a ser reservado: "
  idApto <- getLine
  putStrLn "Dia da reserva: "
  dia <- readLn :: IO Integer
  putStrLn "Mês da reserva: "
  mes <- readLn :: IO Integer

  let reserva = Agenda idApto dia mes True
  putStrLn "Reserva feita."

main :: IO ()
main = do
  criarReserva