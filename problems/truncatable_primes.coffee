truncations = (n) ->
    digits = n.toString()
    return (digits[..i] for d, i in digits).concat((digits[i + 1..] for d, i in digits[1..])).map((x) -> +x)

is_prime = (n) ->
    for i in [2..Math.ceil(Math.sqrt(n))]
        if n % i is 0
            return false
    return true

n = sum = 0
i = 10

while n < 11
    if truncations(i).every(is_prime)
        console.log i
        sum += i
        n++
    i++

console.log sum
