limit = 2000
sum = 0
seen = {}

is_n_pandigital = (n) ->
    str = [1..n].join('')
    return (s) -> s.length is n and s.split('').sort().join('') is str

is_9_pandigital = is_n_pandigital(9)

for x in [1..limit]
    for y in [x..limit]
        prod = x * y
        str = '' + x + y + prod
        if not seen[prod] and is_9_pandigital(str)
            sum += prod
            seen[prod] = true

console.log sum
