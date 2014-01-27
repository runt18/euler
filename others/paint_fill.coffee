assert = require 'assert'

paint_fill = (image, point, colour, orig) ->
    {x, y} = point

    unless orig
        orig = image[x][y]

    if orig isnt colour
        image[x][y] = colour

    if x > 0 and image[x - 1][y] is orig
        image = paint_fill(image, {x: x-1, y}, colour, orig)

    if x < image.length - 1 and image[x + 1][y] is orig
        image = paint_fill(image, {x: x+1, y}, colour, orig)

    if y > 0 and image[x][y - 1] is orig
        image = paint_fill(image, {x, y: y-1}, colour, orig)

    if y < image[0].length and image[x][y + 1] is orig
        image = paint_fill(image, {x, y: y+1}, colour, orig)

    return image

img = [
    [1, 1, 2, 3]
    [1, 1, 2, 3]
    [2, 2, 2, 3]
    [3, 3, 3, 3]
]

expected = [
    [4, 4, 2, 3]
    [4, 4, 2, 3]
    [2, 2, 2, 3]
    [3, 3, 3, 3]
]

assert.deepEqual(paint_fill(img, {x: 0, y: 0}, 4), expected)
