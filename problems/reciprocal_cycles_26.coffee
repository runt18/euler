same = (s) ->
    start = s[0]
    for c in s
        if c isnt start
            return false

    return true

longest_pattern = (s) ->
    return 1 if same(s)

    min = Infinity
    for c, i in s
        sub = s[..i]
        matches = s.match(new RegExp(sub, 'g'))
        n = matches.length
        total = matches.map((x) -> x.length).reduce((m, x) -> m + x)

        if total is s.length and n is s.length / sub.length and n < min
            min = sub.length

    return min

for d in [1...100]
    dec = (1 / d).toFixed(20)[2..]
    if dec
        console.log 1 / d, longest_pattern dec

# console.log longest_pattern 'ababab'
# console.log longest_pattern 'aaaaaa'
# console.log longest_pattern '123123'
# console.log longest_pattern '12341234'
