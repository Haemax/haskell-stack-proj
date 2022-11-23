module Main (main) where

import Menu
import Imovel
import ImovelList
import Locatario

main :: IO ()
main = do
    let im = Imovel {endereco = "abc", cidade = "Pirapora", bairro = "Casa Verde", preco = 100, estaReservado = True}

    let end = getEndereco im
   
    let iml = ImovelList{lista = []}
    
    print (addImovel im iml) 
