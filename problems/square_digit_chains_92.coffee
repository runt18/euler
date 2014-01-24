sum_square_digits = (n) -> n.toString().split('').map((d) -> d * d).reduce((m, x) -> m + x)

square_chain = (n) ->
    return switch n
        when 89 then true
        when 1 then false
        else square_chain(sum_square_digits(n))

n = 0

for x in [1...1e7]
    n++ if square_chain(x)

console.log n
