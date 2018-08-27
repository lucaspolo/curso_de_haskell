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


-- |Função genérica para inverter lista
inverter_lista :: [t] -> [t]

-- |Se lista igual a vazia, retorna vazia
inverter_lista [] = []

-- |Pega a cabeça e joga para o final
inverter_lista (x:xs) = inverter_lista xs ++ [x]

-- |Função para encontrar elemento em lista
pertence :: [Int] -> Int -> Bool
-- |Caso a lista esteja vazia, já percorreu ela toda, retorna False
pertence [] _ = False
-- |Itera recursivamente na lista, caso encontre, retorna True
pertence (x:xs) elem | (x == elem) = True
                     | otherwise = pertence xs elem

-- |Função para buscar o maior elemento de uma lista
maior :: [Int] -> Int
-- |Caso a lista tenha um elemento, o maior elemento é o próprio
maior [x] = x
-- |Compara com a lista
maior (x:xs) | (x > maior xs) = x
             | otherwise = maior xs

todos_pares :: [Int] -> Bool
todos_pares [] = True
todos_pares (x:xs) | (mod x 2 == 1) = False
                   | otherwise = todos_pares xs