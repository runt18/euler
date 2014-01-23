rotations = (n) ->
    digits = n.toString()
    return (digits[i..] + digits[...i] for x, i in digits).map((x) -> +x)

is_prime = (n) ->
    for i in [2..Math.floor(Math.sqrt(n))]
        if n % i is 0
            return false
    return true

n = 0

for i in [1..1e6]
    n++ if rotations(i).every(is_prime)

console.log n
