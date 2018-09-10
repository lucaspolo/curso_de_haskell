factorial x =
    tailFact x 1
    where tailFact 0 a = a
          tailFact n a = tailFact (n - 1) (n * a)