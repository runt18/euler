spiral = (size) ->
    max = size * size
    matrix = ([] for x in [1..size])
    x = y = Math.floor(size / 2)
    directions = 'rdlu'

    i = k = 0
    list = ''
    while k < max
        j = 0
        while ++j < i / 2
            list += directions[i % 4]
            k++
        i++

    for c, i in list
        matrix[x][y] = i + 1

        switch c
            when 'r' then x++
            when 'l' then x--
            when 'u' then y--
            when 'd' then y++

    return matrix

sum_diags = (m) ->
    sum = 0
    l = m.length
    sum += m[i][i] + m[i][l - 1 - i] for x, i in m
    return sum - 1

console.log sum_diags spiral 1001
