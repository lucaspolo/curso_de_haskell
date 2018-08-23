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