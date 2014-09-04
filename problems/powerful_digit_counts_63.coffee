x = 1
epsilon = 0.00000000000001
loop
    l = x.toString().length
    root = Math.pow(x, 1 / l)
    c = Math.ceil(root)
    f = Math.floor(root)
    if (root < c and c - root < epsilon) or (root > f and root - f < epsilon)
        console.log x, l
    x++
