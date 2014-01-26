assert = require 'assert'

map = {}

for s, y in 'abcdefghijklmnopqrstuvwxyz'.match(/[a-z]{3}/g)
    for c, x in s
        map[c] = {x, y}

remote_path = (s) ->
    pos = {x: 0, y: 0}
    out = ''
    dirs = 'RLDU'

    for c in s
        dest = map[c]

        for dir, i in [dest.x - pos.x, dest.y - pos.y] when dir isnt 0
            char = if dir > 0 then dirs[i * 2] else dirs[i * 2 + 1]
            out += new Array(Math.abs(dir) + 1).join(char)

        pos = dest
        out += 'P'

    return out

assert.equal(remote_path('feed'), 'RRDPLPPLP')
