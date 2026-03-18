- 1-8 Do the [exercises at bottom of FPIL 1.6.5](https://lean-lang.org/functional_programming_in_lean/Getting-to-Know-Lean/Polymorphism/#polymorphism-exercises
).

- 9: Write a function **find?** to find an item satisfying
a predicate in a given list of items of arbitrary type α,
or returns Option.none if no such item is found. Here a
predicate means a function α → boolean.

- 10: Create a function **count** that for a given list
of α items, counts the number of items satisfying a
predicate.

- 11: Write a function **sum** to find the sum of a list
of Nats.

- 12: Write functions **max?** and **min?** to find the
maximum and minimum value respectively for a list of Nats,
returning Option Nat.

- 13 Next read these [notes about type classes](https://github.com/scharris/lean-course/blob/main/type-classes.lean).
Then try to write more general functions for **sum**,
**max?**, and **min?** by introducing a general
element type α for the list items, and then constraining
α with appropriate type classes. *Hint: For max and min
use typeclass Ord which provides access to the
Ord.compare function.
  Use it like:
  #eval compare 1 2 == Ordering.lt
  (=> true)*
