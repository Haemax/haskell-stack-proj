module Imovel (Imovel(..), getEndereco) where

    data Imovel =  Imovel { endereco :: String
                     , cidade :: String
                     , bairro :: String
                     , preco :: Float
                     , estaReservado :: Bool}
                    deriving (Eq, Show, Ord)

    getEndereco :: Imovel -> String
    getEndereco Imovel {endereco = e} = e

