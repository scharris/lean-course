# Fold

Like `map`, the `fold` function is a crucial list or sequence
processing function, and is often used in data processing.

Whereas `map` transforms a list into another list item by item,
where the transformer function can only act on each item
independently, the `fold` function produces an "accumulated"
value of arbitrary type derived from *all* list items. It does
so by successively combining each sequence item with the
accumulated value to form the next accumulated value, until
the list is exhausted and the final accumulated value is
returned as the result. What varies here (which is to say what
must be supplied as arguments) is the accumulation function
showing how to combine a sequence item and an accumulated value,
and the initial value.

- Read the first few pages of [A tutorial on the universality and
expressiveness of fold](https://people.cs.nott.ac.uk/pszgmh/fold.pdf),
from the page marked 355 (first page) through first half of p.358
(stop before 3.1).

## Haskell Examples
The `fold` definition and example functions in the paper are
written in Haskell, which is one of Lean's infuential
predecessor languages. Much of Lean's constructs and syntax
are derived from Haskell, though Haskell does not currently
support the dependent typing that is necessary for theorem
proving (on the other hand, Haskell does have more industry support).
The only differences for our purposes are that:
  - Haskell allows repeating the function name for each pattern
  in place of match expressions with `|` (which it also supports),
  like:
    ```haskell
    length [] = 0
    length a:as = 1 + length as
    ```
    Whereas lean would start each pattern with a bar (|) instead:
    ```lean
    def length : List a -> Nat
    | [] => 0
    | a::as => 1 + length as
    ```
  - Haskell uses `:` for list cons operation instead of `::`,
    and uses `::` to separate a value from its type (ie. roles
    of `:` and `::` are swapped).
  - Haskell doesn't require the `def` keyword to introduce a
  function.

With those minor differences in mind, translate these
definitions from the paper into Lean:
  -  `fold`
  -  `sum`
  -  `and`
  -  `length`
  -  `reverse`
  -  `map`
  -  `filter`

## Left Fold

The paper describes more specifically the `foldr` or right-fold
function, where the accumulated value is first combined with the
last (right-most) value in the sequence, then the next to last,
etc., until finally being combined with the first item to form
the final result.

Another variant of fold is `foldl`, for "fold left", defined as
below. It combines the initial value with the first (left-most)
sequence item first, and then proceeds combining with items
rightwards until the right most item is combined to form the
final result.

```lean
def foldl (f : α → β → α) (acc : α) (l : List β) : α :=
  match l with
  | [] => acc
  | x::xs => foldl f (f acc x) xs
```

For many operations `foldl` and `foldr` produce the same
result when given the same combining function (with only
swapped parameters order). For example, when the combining
function is an associative binary operator like plus on
`Nat`s, then results are the same. In other cases, the
ordering of the combining operations matters and the
particular use-case will determine which is best to use.

Both functions model how computations are performed on
a sequence of inputs potentially producing a state change
(change in accumulated value) at each successive input.
This makes them able to model many (though not all) of the
kinds of computations that algorithms can perform.