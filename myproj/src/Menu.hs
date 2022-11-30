module Menu(menu) where


menu:: IO ()
menu = do
    putStr("Bem vindo ao RoofBNB!")
    putStr("1 - Locatário")
    putStr("2 - Locador")
    op <- readLn:: IO Int
    case op of
       1 -> locatarioSub 
       2 -> locadorSub
       otherwise -> menu

locadorSub :: IO ()
locadorSub = _

locatarioSub :: IO ()
locatarioSub = do
    putStr("Esta eh a interface do locatario")
    putStr("1 - Busca de imovel pelo endereço")
    putStr("2 - Busca de imovel pela faixa de preco")
    putStr("3 - Checar imoveis vagos na data estipulada")