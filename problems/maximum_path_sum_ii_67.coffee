data = require('fs').readFileSync('res/triangle_67.txt', 'utf-8').split('\n')[..-2]
triangle = (line.split(' ').map((x) -> +x) for line in data)

max_route = (data) ->
  i = data.length - 2

  while i >= 0
    row = data[i]
    for num, j in row
      data[i][j] += Math.max(data[i + 1][j], data[i + 1][j + 1])
    i--

  return data[0][0]

console.log max_route(triangle)
