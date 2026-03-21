- 1-8 Do the [exercises at bottom of FPIL 1.6.5](https://lean-lang.org/functional_programming_in_lean/Getting-to-Know-Lean/Polymorphism/#polymorphism-exercises
).

- 9: Write a function `zipWith` that takes a function`f : α → β → γ`,
and two lists with item types of α and β respectively, and produces
a List of γ.

- 10: Create a function `count` that for a given predicate and
list of items of arbitrary type `α`, returns a `Nat` count of
the number of items satisfying the predicate.

  Test it as follows:
  ```lean
  #eval count (fun n => Nat.mod n 2 == 0) [1,2,3,4,5] -- 2
  #eval count (fun n => Nat.mod n 9 == 0) [1,2,3,4,5] -- 0
  ```

- 11: Write a function `sumNats` to find the sum of a list
of Nats. The some of an empty list should be 0.
  Test it as follows:
  ```lean
  #eval sumNats [1,2,3] -- 6
  #eval sumNats ([] : List Nat) -- 0
  ```

- 12: Write functions `maxNat?` and `minNat?` to find the maximum
and minimum value respectively for a list of `Nat`s, returning
an `Option Nat`.
  Test these as follows:
  ```lean
  #eval maxNat [5,1,2,7,3] -- some 7
  #eval maxNat ([] : List Nat) -- none
  #eval minNat [5,1,2,7,3] -- some 1
  #eval minNat ([] : List Nat) -- none
  ```

- 13 Next read these [notes about type classes](https://github.com/scharris/lean-course/blob/main/type-classes.lean).
Then try to write more general functions `sum`, `max?`, and `min?`
for the functions in problems 11 and 12, by introducing a general
element type `α` for the list items, and then constraining `α`
with appropriate type classes.

  *Hint: For `max` and `min` use type class `Ord` which provides
  access to the `compare` function. Use compare like:*
  ```lean
  #eval compare 1 2 == Ordering.lt -- true
  ```

  Test as follows:
  ```lean
  #eval sum [5,1,2,7,3] -- 18
  #eval sum [5.0,1.0] -- 6.000000
  #eval sum ([] : List Nat) -- 18

  #eval max [5,1,2,7,3] -- some 7
  #eval max ["abc", "ab", "i", "cd"] -- some "i"
  #eval max ([]: List Nat) -- none

  #eval min [5,1,2,7,3] -- some 1
  #eval min ["abc", "ab", "i", "cd"] -- some "ab"
  #eval min ([] : List String) -- none
  ```
