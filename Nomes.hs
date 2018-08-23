-- |Define funções para retornar elementos específicos de uma tupla
nomes :: (String, String, String)
nomes = ("Lucas", "Prado", "Polo")

primeiro (x, _, _) = x
segundo (_, y, _) = y
terceiro (_, _, z) = z