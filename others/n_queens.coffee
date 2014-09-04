# If the remainder from dividing N by 6 is not 2 or 3 then the list is simply all even numbers followed by all odd numbers ≤ N
# Otherwise, write separate lists of even and odd numbers (i.e. 2,4,6,8 - 1,3,5,7)
# If the remainder is 2, swap 1 and 3 in odd list and move 5 to the end (i.e. 3,1,7,5)
# If the remainder is 3, move 2 to the end of even list and 1,3 to the end of odd list (i.e. 4,6,8,2 - 5,7,9,1,3)
# Append odd list to the even list and place queens in the rows given by these numbers, from left to right (i.e. a2, b4, c6, d8, e3, f1, g7, h5)

# Returns every (xn + o)th element of the array
nths = (a) -> ((a) -> ((n, o) -> (x for x, i in a when i % n is o)))(a)
evens = (a) -> nths(a)(2, 0)
odds = (a) -> nths(a)(2, 1)

n_queens = (n) ->
    if n % 6 in [2, 3]
        o = odds([1..n]
        e = evens[1..n]
        if n is 2
            o[1..2] = [3, 1]
            o.splice(3, 1)
            o.append(5)
        if n is 3
            e = e[1..]
            e.append(2)
            o = o[2..].concat([1, 3])

        console.log(e.concat(odds))
    else
        console.log(odds([1..n].concat(evens[1..n])))
