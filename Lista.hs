-- |Função size que retorna o tamanho da lista
-- |Quando vazia, tamanho zero
size [] = 0

-- |x é a cabeça da lista (de tamanho um), xs é o restante da lista
size (x:xs) = 1 + size xs

-- |Função que verifica se duas listas são iguais (# elementos, na mesma posição)

comp_listas :: [Int] -> [Int] -> Bool

-- |Caso ambas vazias, são iguais
comp_listas [] [] = True
-- |Caso uma delas vazia e a outra não, são diferentes
comp_listas [] _ = False
comp_listas _ [] = False

-- |Se o primeiro elemento igual, compara outros elementos chamando recursivamente
comp_listas (x:xs) (y:ys) | (x == y) = comp_listas xs ys
                          | otherwise = False