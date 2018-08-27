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