assert = require 'assert'
_ = require 'lodash'

pairs_of_parens = (n) -> if n is 1 then ['()'] else _.uniq(_.flatten((["()#{set}", "(#{set})", "#{set}()"] for set in pairs_of_parens(n - 1))))

assert.deepEqual(pairs_of_parens(1), ['()'])
assert.deepEqual(pairs_of_parens(2), ['()()', '(())'])
assert.deepEqual(pairs_of_parens(3), ['()()()', '(()())', '()(())', '((()))', '(())()'])

for x in [1..10]
  console.log x, pairs_of_parens(x).length
