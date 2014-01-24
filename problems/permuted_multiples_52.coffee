x = 1

f = (n) -> n.toString().split('').sort().join('')

while x++
    s = f(x)
    if [2..6].map((i) -> f(x * i)).every((i) -> i is s)
        console.log x
        break
