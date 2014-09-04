getlowestfraction = (x0) ->
    eps = 1.0e-50
    x = x0
    a = Math.floor(x)
    h1 = 1
    k1 = 0
    h = a
    k = 1

    while x - a > eps * k * k
        x = 1 / (x - a)
        a = Math.floor(x)
        h2 = h1
        h1 = h
        k2 = k1
        k1 = k
        h = h2 + a * h1
        k = k2 + a * k1

    return [h, k]

num_digits = (x) -> x.toString().length

max = 100

n = 0

root2r = (level) ->
    v = if level < max then root2r(level + 1) else 0
    r = 1 / (2 + v)
    [num, den] = getlowestfraction r + 1
    console.log [num, den]
    if num_digits(num) > num_digits(den)
        n++
    return r

root2 = -> 1 + root2r(0)

root2()
console.log n
