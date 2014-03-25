triangle = (n) -> n * (n + 1) / 2
pentagon = (n) ->  n * (3 * n - 1) / 2
hexagon = (n) -> n * (2 * n - 1)

pents = {}
hexes = {}
big = 1e10

for a in [{fn: hexagon, sto: hexes}, {fn: pentagon, sto: pents}]
    x = 1
    while (y = a.fn(x)) < big
        a.sto[y] = true
        x++

x = 1
i = 0
while (t = triangle(x)) < big
    if t of pents and t of hexes
        i++
        if i > 2
            console.log t
            break
    x++
