data = require('fs').readFileSync('res/triangle_18.txt', 'utf-8').split('\n')[..-2]
triangle = (line.split(' ').map((x) -> +x) for line in data)

max_route = (i=0, j=0, depth=triangle.length-1) ->
    triangle[i][j] + if depth is 0 then 0 else Math.max(max_route(i + 1, j, depth - 1), max_route(i + 1, j + 1, depth - 1))

console.log max_route()
