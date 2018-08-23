-- |Recebe duas tuplas e soma seus elementos
func :: (Int, Int) -> (Int, Int) -> (Int, Int)
func (a, b) (c, d) = (a + c, b + d)