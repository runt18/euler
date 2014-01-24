factorial = (n) -> if n is 0 then 1 else n * factorial(n - 1)

count = 0

for n in [1..100]
    for r in [1..n]
        count++ if factorial(n) / (factorial(r) * factorial(n - r)) > 1e6

console.log count
