# Curso de Haskell

Este repositório contém códigos referentes ao curso de Haskell disponível na [Udemy gratuitamente](https://www.udemy.com/curso-haskell)


## Recursão

Recursão em Haskell é bem simples, alguns exemplos:

1) Fatorial:

    ```haskell
    fatorial 0 = 1
    fatorial n = n * fatorial ( n - 1 )
    ```
2) Fibonacci:
   
    ```haskell
    fib 0 = 0 
    fib 1 = 1
    fib n = fib (n - 1) + fib (n - 2)
    ```

Como podemos ver, temos um exemplo simples também de pattern matching, pois primeiro são verificados se a chamada da função casa com os valores constantes, depois é repassado para a chamada com variável.


## Guardas

Guardas são uteis para verificar se um valor é igual a outro ou está em uma condição específica:

```haskell
guarda x | ( x == 0 ) = 0
         | ( x == 1 ) = 1
         | otherwise = 10
```


## Variável anonima

As vezes, quando realizamos pattern matching, queremos ignorar determinado valor, porém é necessário especificar que estamos o recebendo. Para isto podemos denotar este valor como **_** (underscore):

```haskell
-- |Função que implementa a lógica do operador And
myAnd :: Bool -> Bool -> Bool
myAnd False _ = False
myAnd _ False = False
myAnd True True = True
```


## Tuplas

Haskell suporta nativamente as tuplas, para isto basta descrevermos seus elementos dentro de **()** (parentêses) como no Python.

```haskell
-- |Recebe duas tuplas e soma seus elementos
func :: (Int, Int) -> (Int, Int) -> (Int, Int)
func (a, b) (c, d) = (a + c, b + d)
```

Podemos acessar elementos individuais da tupla através de funções padrões do Haskell:

```haskell
fst tupla
snd tupla
```

Também podemos definir funções similares que acessam dados da tupla:

```haskell
-- |Define funções para retornar elementos específicos de uma tupla
nomes :: (String, String, String)
nomes = ("Lucas", "Prado", "Polo")

primeiro (x, _, _) = x
segundo (_, y, _) = y
terceiro (_, _, z) = z
```

## Criação de tipos complexos

É possível criar novos tipos usando a palavra `type`. Para nosso exemplo vamos definir um tipo pessoa, porém antes iremos também definir os tipos de seus atributos, como Nome, Idade e Linguage (predileta):

```haskell
-- |Definição dos tipos a serem usados por Pessoa
type Nome = String
type Idade = Int
type Linguagem = String

-- |Definição do Tipo pessoa
type Pessoa = (Nome, Idade, Linguagem)

-- |Definição de uma variável pessoa
pessoa :: Pessoa

-- |Criação da variável
pessoa = ("Lucas", 28, "Python")

-- |Função para retornar o nome
my_fst :: Pessoa -> Nome
my_fst (n, _, _) = n
```

Também aproveitamos e criamos uma função que retorna o nome, utilizando novamente pattern matching.


## Listas

Listas em Haskell são criadas através de colchetes (`[]`). Seus elementos vão entre estes colchetes e são separados por virgulas:

```haskell
-- |Lista vazia
[]

-- |Lista com elementos
[1,2,3]
```

O primeiro elemento é a "cabeça" da lista e cada elementa aponta para seu elemento posterior. Para retornar o primeiro elemento temos a função `head` e para retornar o restante temos `tail`:

```haskell
Prelude> lista = [1,2,3]
Prelude> head lista
1
Prelude> tail lista
[2,3]
```

Para adicionar um elemento a lista podemos utilizar o operador dois pontos (`:`):

```haskell
Prelude> 1:[2,3]
[1,2,3]
```

Também funciona para lista vazia, permitindo assim criar a lista:

```haskell
Prelude> 1:2:3:[]
[1,2,3]
```

Para determinarmos o tamanho da lista, podemos utilizar uma estratégia recursiva, que conta o tamanho de uma lista removendo seus elementos até não sobrar nenhum outro:

```haskell
-- |Função size que retorna o tamanho da lista
-- |Quando vazia, tamanho zero
size [] = 0

-- |x é a cabeça da lista (de tamanho um), xs é o restante da lista
size (x:xs) = 1 + size xs
```

Para compararmos duas listas, podemos definir uma função que verifica recursivamente as listas:

```haskell
comp_listas :: [Int] -> [Int] -> Bool

-- |Caso ambas vazias, são iguais
comp_listas [] [] = True
-- |Caso uma delas vazia e a outra não, são diferentes
comp_listas [] _ = False
comp_listas _ [] = False

-- |Se o primeiro elemento igual, compara outros elementos chamando recursivamente
comp_listas (x:xs) (y:ys) | (x == y) = comp_listas xs ys
                          | otherwise = False
```

Podemos criar uma função para inverter uma lista simplesmente retornando a cauda da lista com o valor da cabeça concatenado ao final:

```haskell
-- |Função genérica para inverter lista
inverter_lista :: [t] -> [t]

-- |Se lista igual a vazia, retorna vazia
inverter_lista [] = []

-- |Pega a cabeça e joga para o final
inverter_lista (x:xs) = inverter_lista xs ++ [x]
```

Para verificarmos se um elemento pertence a uma lista podemos utilizar a seguinte abordagem:

```haskell
-- |Função para encontrar elemento em lista
pertence :: [Int] -> Int -> Bool

-- |Caso a lista esteja vazia, já percorreu ela toda, retorna False
pertence [] _ = False

-- |Itera recursivamente na lista, caso encontre, retorna True
pertence (x:xs) elem | (x == elem) = True
                     | otherwise = pertence xs elem
```

De maneira similar, podemos buscar seu maior elemento:

```haskell
-- |Função para buscar o maior elemento de uma lista
maior :: [Int] -> Int
-- |Caso a lista tenha um elemento, o maior elemento é o próprio
maior [x] = x
-- |Compara com a lista
maior (x:xs) | (x > maior xs) = x
             | otherwise = maior xs
```

E saber se todos os seus elementos são pares:

```haskell
-- |Função para verifica se todos os elementos são pares
todos_pares :: [Int] -> Bool
todos_pares [] = True
todos_pares (x:xs) | (mod x 2 == 1) = False
                   | otherwise = todos_pares xs
```

### Compreensão de listas

Haskell permite a compreensão de listas, isto é, podemos gerar listar definindo as regras para a lista. Uma lista simples é: 

```haskell
Prelude> [x | x <- [1,2,3]]
[1,2,3]
```

Também podemos operar este `x` antes de incluí-lo na lista:

```haskell
Prelude> [x * x| x <- [1,2,3]]
[1,4,9]
```

Para gerar os números como sequência podemos usar a seguinte notação:

```haskell
Prelude> [1 .. 10]
[1,2,3,4,5,6,7,8,9,10]
Prelude> [ x * x | x <- [1 .. 10] ]
[1,4,9,16,25,36,49,64,81,100]
```

Também é possível adicionar expressões para filtrar os elementos desta lista:

```haskell
Prelude> [ x * x | x <- [1 .. 10], mod x 2 == 0 ]
[4,16,36,64,100]
```

Pode-se acumular condições:

```haskell
Prelude> [ x * x | x <- [1 .. 10], mod x 2 == 0, x > 5 ]
[4,16,36,64,100]
```

Podemos também gerar tuplas de dados, como no exemplo abaixo onde será gerado o produto dos conjuntos:

```haskell
Prelude> [(x,y) | x <- [1..3], y <- [6..9]]
[(1,6),(1,7),(1,8),(1,9),(2,6),(2,7),(2,8),(2,9),(3,6),(3,7),(3,8),(3,9)]
```