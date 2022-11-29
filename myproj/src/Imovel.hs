module Imovel (Imovel(..), getEndereco) where

    data Imovel =  Imovel { endereco :: String
                     , cidade :: String
                     , bairro :: String
                     , preco :: Float
                     , estaReservado :: Bool}
                    deriving (Eq, Show, Ord)

    getEndereco :: Imovel -> String
    getEndereco Imovel {endereco = e} = e

    setEndereco :: String -> Imovel -> Imovel
    setEndereco end im = im {endereco = end}

    getCidade :: Imovel -> String
    getCidade Imovel {cidade = e} = e

    setCidade :: String -> Imovel -> Imovel
    setCidade cid im = im {cidade = cid}

    getBairro :: Imovel -> String
    getBairro im = im {bairro = bar}
    
    setBairro :: String -> Imovel -> Imovel
    setBairro bar im = im {bairro = bar}
    
    getPreco :: Imovel -> String
    getPreco Imovel {preco = e} = e

    setPreco :: String -> Imovel -> Imovel
    setPreco prec im = im {preco = prec}

    isReservado :: Imovel -> String
    isReservado Imovel {estaReservado = e} = e

    setReservado :: Bool -> Imovel -> Imovel
    setEndereco x im = im {isReservado = x}

