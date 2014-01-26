assert = require 'assert'

permutations = (s) ->
    if s.length is 1
        yeild [s]
    else
        res = []
        for c, i in s
            v = s.split('')
            v.splice(i, 1)
            res = res.concat((c + perm for perm in permutations(v.join(''))))
        return res

next_same_digits = (n) ->
    perms = permutations(n.toString()).map((x) -> +x)
    for perm in perms
        if perm > n
            return perm

    return null

assert.equal(next_same_digits(12345), 12354)
assert.equal(next_same_digits(5412), 5421)
assert.equal(next_same_digits(321), null)
