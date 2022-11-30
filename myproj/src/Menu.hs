module Menu(menu) where
import Locatario (buscaEndereco, buscaPreco, buscaData)
import Locador (listarImoveis, cadastrarImovel, criarReserva)


menu:: IO ()
menu = do
    putStr("Bem vindo ao RoofBNB!")
    putStr("1 - Locatário")
    putStr("2 - Locador")
    op <- readLn:: IO Int
    case op of
       1 -> locatarioSub 
       2 -> locadorSub
       otherwise -> locadorSub

locadorSub :: IO ()
locadorSub = do
    putStr("Esta eh a interface do locador")
    putStr("1 - Cadastrar imovel")
    putStr("2 - Criar uma reserva")
    op <- readLn:: IO Int
    case op of
       1 -> cadastrarImovel
       2 -> criarReserva
       otherwise -> locadorSub

locatarioSub :: IO ()
locatarioSub = do
    putStr("Esta eh a interface do locatario")
    putStr("1 - Busca de imovel pelo endereço")
    putStr("2 - Busca de imovel pela faixa de preco")
    putStr("3 - Checar imoveis vagos na data estipulada")
    putStr("4 - Listar todos os imoveis disponiveis")
    op <- readLn:: IO Int
    case op of
       1 -> buscaEndereco
       2 -> buscaPreco
       3 -> buscaData
       4 -> listarImoveis
       otherwise -> locatarioSub