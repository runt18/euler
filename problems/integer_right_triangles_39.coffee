solutions = (n) ->
    res = []
    n = Math.floor(n / 3)
    for i in [1...n]
        j = n - i
        sq = Math.sqrt(i * i + j * j)
        if Math.floor(sq) is sq
            res.push([i, j, sq])

    return res

console.log solutions 120
