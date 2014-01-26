rotations = (n) ->
    digits = n.toString()
    return (digits[i..] + digits[...i] for x, i in digits).map((x) -> +x)

is_prime = (n) ->
    return false if n < 2
    return true if n is 2
    for i in [2..Math.ceil(Math.sqrt(n))]
        if n % i is 0
            return false
    return true

n = 0

for i in [1...1e6]
    if rotations(i).every(is_prime)
        n++

console.log n
