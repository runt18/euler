permutations = (s) ->
    if s.length is 1
        return [s]
    else
        res = []
        for c, i in s
            v = s.split('')
            v.splice(i, 1)
            res = res.concat((c + perm for perm in permutations(v.join(''))))
        return res

divisors = [2, 3, 5, 7, 11, 13, 17]

sum = 0

for perm in permutations '1234567890'
    sum += (+perm) if divisors.every((d, i) -> +perm[i+1..i+3] % d is 0)

console.log sum
