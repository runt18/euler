limit = 1e8
factors = (2 for x in [1..limit+1])
goal = 500

i = 2
while i < limit
    r = 2
    while i * r  < limit
        factors[i * r]++
        r++
    i++

triangular = 1
increment = 2

while triangular < limit
    if factors[triangular] > goal
        console.log triangular

    triangular += increment
    increment++
