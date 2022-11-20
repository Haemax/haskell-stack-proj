import Text.Printf

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
  printf "Valor da diária: "
  diaria <- readLn :: IO Double
  printf "Telefone para contato: "
  telefone <- getLine
  printf "Tipo do imóvel: "
  tipo <- getLine
  printf "Quantidade de quartos: "
  quartos <- readLn :: IO Integer
  printf "Quantidade de quartos com suíte: "
  quartosSuite <- readLn :: IO Integer
  printf "Quantidade de banheiros: "
  banheiros <- readLn :: IO Integer
  printf "Quantidade de vagas de garagens: "
  garagens <- readLn :: IO Integer
  printf "Limite de hóspedes: "
  hospedes <- readLn :: IO Integer
  printf "Tem wi-fi? "
  wifi <- getLine
  printf "Tem piscina? "
  piscina <- getLine
  printf "Aceita animais? "
  animais <- getLine

  printf "CEP: "
  cep <- getLine
  printf "Rua: "
  rua <- getLine
  printf "Número: "
  numero <- getLine
  printf "Complemento: "
  complemento <- getLine
  printf "Bairro: "
  bairro <- getLine
  printf "Cidade: "
  cidade <- getLine
  printf "Estado: "
  estado <- getLine

  let endereco = Endereco cep rua numero complemento bairro cidade estado
  let apto = Apartamento diaria telefone tipo quartos quartosSuite banheiros garagens hospedes wifi piscina animais endereco
  printf "Imóvel cadastrado."

criarReserva :: IO ()
criarReserva = do
  printf "Id do apartamento a ser reservado: "
  idApto <- getLine
  printf "Dia da reserva: "
  dia <- readLn :: IO Integer
  printf "Mês da reserva: "
  mes <- readLn :: IO Integer

  let reserva = Agenda idApto dia mes True
  printf "Reserva feita."

main :: IO ()
main = do
  criarReserva