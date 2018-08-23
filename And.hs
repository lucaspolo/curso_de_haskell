-- |Função que implementa a lógica do operador And
myAnd :: Bool -> Bool -> Bool
myAnd False _ = False
myAnd _ False = False
myAnd True True = True