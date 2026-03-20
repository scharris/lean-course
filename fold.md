# Fold

Like `map` the `fold` function is a crucial list or sequence
processing function, and often used in data processing.

Whereas `map` transforms a list into another list item by item,
where the transformer function can only act on each item
independently, the `fold` function produces an "accumulated"
value of arbitrary type derived from all list items. It does
so by starting with an initial value for the accumulator, and
then successively combining each sequence item with the current
accumulated value to form the next accumulated value, until the
list is exhausted and the final accumulated value is returned.
What varies here (ie. what must be supplied) is the
accumulation function showing how to combine a sequence item and
an accumulated value, and the initial accumulated value to get
things started.

- Read the first few pages of [A tutorial on the universality and
expressiveness of fold](https://people.cs.nott.ac.uk/pszgmh/fold.pdf),
from the page marked 355 (first page) through first half of p.358
(stop before 3.1).

- Translate the `fold` definition into Lean.

- Translate these examples into Lean:
  -  `sum`
  -  `and`
  -  `length`
  -  `reverse`
  -  `map`
  -  `filter`

## Left Fold

The above describes more specifically the `foldr` or right-fold
function, where the accumulated value is first combined with the
last (right-most) value in the sequence, then the next to last,
etc., until finally being combined with the first item to form
the final result.

Another variant of fold is `foldl` defined as below. It combines
the initial value with the first or left-most sequence item first,
and then proceeds combining with items rightwards until the right
most item is combined to form the final result.

```lean
def foldl (f : α → β → α) (acc : α) (l : List β) : α :=
  match l with
  | [] => acc
  | x::xs => foldl f (f acc x) xs
```

For many operations `foldl` and `foldr` produce the same
result when given the same combining function (with only
swapped parameters order). For example, when the combining
function is an associative binary operator like plus then
results are the same. In other cases, the direction/ordering
of the combining operations matters and the particular
use-case will determine which is best to use.

Both functions model closely how computations are performed
given a sequence of inputs, by changing a state, which is
the accumulating value, successively as more inputs are
received.