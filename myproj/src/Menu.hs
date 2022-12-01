module Menu(menu) where
import Locatario (buscaEndereco, buscaPreco, buscaData)
import Locador (listarImoveis, cadastrarImovel, criarReserva)


menu:: IO ()
menu = do
    putStrLn "Bem vindo ao RoofBNB!"
    putStrLn "1 - Locatário"
    putStrLn "2 - Locador"
    op <- readLn:: IO Int
    case op of
       1 -> locatarioSub 
       2 -> locadorSub
       otherwise -> locadorSub

locadorSub :: IO ()
locadorSub = do
    putStrLn "Esta é a interface do locador"
    putStrLn "1 - Cadastrar imóvel"
    putStrLn "2 - Criar uma reserva"
    op <- readLn:: IO Int
    case op of
       1 -> cadastrarImovel
       2 -> criarReserva
       otherwise -> locadorSub

locatarioSub :: IO ()
locatarioSub = do
    putStrLn "Esta é a interface do locatário"
    putStrLn "1 - Busca de imóvel pelo endereço"
    putStrLn "2 - Busca de imóvel pela faixa de preco"
    putStrLn "3 - Checar imóveis vagos na data estipulada"
    putStrLn "4 - Listar todos os imóveis disponíveis"
    op <- readLn:: IO Int
    case op of
       1 -> buscaEndereco
       2 -> buscaPreco
       3 -> buscaData
       4 -> listarImoveis
       otherwise -> locatarioSub