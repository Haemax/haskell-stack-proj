module Menu(menu) where
import Locatario (buscaEndereco, buscaPreco, buscaData, criarReserva)
import Locador (listarImoveis, cadastrarImovel)

menu:: IO ()
menu = do
    putStrLn "Bem vindo ao RoofBNB!"
    putStrLn "1 - Locatário"
    putStrLn "2 - Locador"
    op <- readLn:: IO Int
    case op of
       1 -> locatarioSub 
       2 -> locadorSub
       otherwise -> menu

locadorSub :: IO ()
locadorSub = do
    putStrLn "Esta é a interface do locador"
    putStrLn "1 - Cadastrar imóvel"
    putStrLn "2 - Voltar ao menu"
    op <- readLn:: IO Int
    case op of
       1 -> cadastrarImovel
       2 -> menu
       otherwise -> locadorSub
    menu

locatarioSub :: IO ()
locatarioSub = do
    putStrLn "Esta é a interface do locatário"
    putStrLn "1 - Busca de imóvel pelo endereço"
    putStrLn "2 - Busca de imóvel pela faixa de preco"
    putStrLn "3 - Checar imóveis vagos na data estipulada"
    putStrLn "4 - Listar todos os imóveis disponíveis"
    putStrLn "5 - Criar reserva por id"
    putStrLn "6 - Voltar ao menu"
    op <- readLn:: IO Int
    case op of
       1 -> buscaEndereco
       2 -> buscaPreco
       3 -> buscaData
       4 -> listarImoveis
       5 -> criarReserva
       6 -> menu
       otherwise -> locatarioSub
    menu