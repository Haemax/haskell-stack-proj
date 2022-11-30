module Menu(menu) where
import Locatario (buscaEndereco, buscaPreco, buscaData)
import Locador (listarImoveis, cadastrarImovel, criarReserva)


menu:: IO ()
menu = do
    print("Bem vindo ao RoofBNB!")
    print("1 - Locatario")
    print("2 - Locador")
    op <- readLn:: IO Int
    case op of
       1 -> locatarioSub 
       2 -> locadorSub
       otherwise -> locadorSub

locadorSub :: IO ()
locadorSub = do
    print("Esta eh a interface do locador")
    print("1 - Cadastrar imovel")
    print("2 - Criar uma reserva")
    op <- readLn:: IO Int
    case op of
       1 -> cadastrarImovel
       2 -> criarReserva
       otherwise -> locadorSub

locatarioSub :: IO ()
locatarioSub = do
    print("Esta eh a interface do locatario")
    print("1 - Busca de imovel pelo endereço")
    print("2 - Busca de imovel pela faixa de preco")
    print("3 - Checar imoveis vagos na data estipulada")
    print("4 - Listar todos os imoveis disponiveis")
    op <- readLn:: IO Int
    case op of
       1 -> buscaEndereco
       2 -> buscaPreco
       3 -> buscaData
       4 -> listarImoveis
       otherwise -> locatarioSub