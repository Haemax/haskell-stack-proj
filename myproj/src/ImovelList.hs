{-# HLINT ignore "Use newtype instead of data" #-}

module ImovelList (ImovelList(..), addImovel) where
    import Imovel

    data ImovelList = ImovelList{lista :: [Imovel]}
                    deriving (Eq, Show, Ord)

    addImovel :: Imovel -> ImovelList -> ImovelList
    addImovel im ImovelList{lista = l} = ImovelList{lista = im:l}

    