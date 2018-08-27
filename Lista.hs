-- |Função size que retorna o tamanho da lista

-- |Quando vazia, tamanho zero
size [] = 0

-- |x é a cabeça da lista (de tamanho um), xs é o restante da lista
size (x:xs) = 1 + size xs