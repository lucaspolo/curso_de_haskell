fatorial :: (Integral a) => a -> a
fatorial 0 = 1
fatorial n = n * fatorial ( n - 1 )