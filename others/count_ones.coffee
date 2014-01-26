console.log [4532..14532].map((x) -> x.toString().split('').map((x) -> +x).filter((x) -> x is 1).length).reduce((m, x) -> m + x)
