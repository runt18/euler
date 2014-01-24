_ = require 'lodash'
fs = require 'fs'

read = (p) -> fs.readFileSync(p, 'utf-8')

class Vertex
    constructor: (@x, @y, @distance=Infinity, @neighbours=[]) ->

class Edge
    constructor: (@target=null, @cost=0) ->

extract_min = (a) -> a.splice(a.indexOf(_.min(a, (x) -> x.distance)), 1)[0]

dijkstra = (m) ->
    size = m.length - 1
    queue = (new Vertex(x, y) for y in [0..size] for x in [0..size])

    for i in [0..size]
        for j in [0..size]
            queue[i][j].neighbours.push(new Edge(queue[i][j + 1], m[i][j + 1])) if j < size
            queue[i][j].neighbours.push(new Edge(queue[i + 1][j], m[i + 1][j])) if i < size

    queue = _.flatten(queue)
    queue[0].distance = 0

    until queue.length is 0
        u = extract_min(queue)

        for n in u.neighbours
            t = n.target
            new_dist = u.distance + n.cost
            if t.distance > new_dist
                t.distance = new_dist
                ret = t.distance if t.x is size and t.y is size

    return ret + m[0][0]

lines = read('res/matrix_81.txt').split('\n')[...-1]
m = (line.split(',').map((x) -> +x) for line in lines)
console.log(dijkstra(m))
