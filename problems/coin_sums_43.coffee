denoms = [1, 2, 5, 10, 20, 50, 100, 200]

coin_sum = (n, denom) ->
    return 1 if denom is 1

    next = denoms[denoms.indexOf(denom) - 1]
    return (coin_sum(n - i, next) for i in [0..n] by denom).reduce((m, x) -> m + x)

target = 200
console.log coin_sum(target, denoms[denoms.length - 1])
