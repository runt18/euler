{pow, bignumber} = require('mathjs')(decimals: 100)

max = 0

for a in [1...100]
    for b in [1...100]
        sum = pow(bignumber(a), bignumber(b)).toFixed(100).split('')
            .map((d) -> if d is '.' then 0 else +d).reduce((m, x) -> m + x)
        max = sum if sum > max

console.log max
