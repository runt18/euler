assert = require 'assert'

matched = (s) ->
    types = [0, 0, 0]
    chars = '()[]{}'

    for c in s
        for type, i in types
            switch c
                when chars[i * 2] then types[i]++
                when chars[i * 2 + 1] then types[i]--

    return types.every((x) -> x is 0)

assert.equal(matched('({[]})'), true)
assert.equal(matched('({['), false)

