sort = (s) -> s.toString().split('').sort().join('')

is_anagram = (s1, s2) -> sort(s1) is sort(s2)

is_prime = (n) ->
    for i in [2..Math.floor(Math.sqrt(n))]
        if n % i is 0
            return false
    return true

for x in [1000..3340] when x isnt 1487
    terms = [0..2].map((i) -> x + i * 3330)
    if terms[1..].every((i) -> is_anagram(terms[0], i)) and terms.every(is_prime)
        console.log(terms.join(''))
