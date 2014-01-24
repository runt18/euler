rev = (s) -> s.toString().split('').reverse().join('')

is_palindrome = (s) -> s is rev(s)

is_lychrel = (n, level=1) ->
    rev_add = n + (+rev(n))
    return false if is_palindrome(rev_add.toString())
    return true if level is 50
    return is_lychrel(rev_add, level + 1)

console.log [1..10000].filter((x) -> is_lychrel(x)).length
