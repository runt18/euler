data = require('fs').readFileSync('res/triangle_18.txt', 'utf-8').split('\n')[..-2]
triangle = (line.split(' ').map((x) -> +x) for line in data)

build_tree = (i=0, j=0, depth=triangle.length-1) ->
    tree = {}
    tree.value = triangle[i][j]

    return tree if depth is 0

    tree.left = build_tree(i + 1, j, depth - 1)
    tree.right = build_tree(i + 1, j + 1, depth - 1)
    return tree

max_route = (tree) ->
    return tree.value unless tree.left or tree.right
    return tree.value + Math.max(max_route(tree.left), max_route(tree.right))

console.log max_route(build_tree())
