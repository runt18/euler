{floor, pow, log, ceil} = Math

base = 10

log_base = (n, base) -> log(n) / log(base)

get_digit = (n, i) -> floor(n / pow(base, i)) % base

num_digits = (n) -> floor(log_base(n, base) + 1)

factorial = (n) -> if n is 0 then 1 else n * factorial(n - 1)

x = 10
sum = 0

while x < 2e6
    s = [num_digits(x)-1..0]
        .map((i) -> get_digit(x, i))
        .map((x) -> factorial(x))
        .reduce((m, x) -> m + x)
    sum += x if s is x
    x++

console.log sum
