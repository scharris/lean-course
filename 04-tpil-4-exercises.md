# Theorem Proving in Lean Chapter 4 Exercises

## Pre-exercises

- 0.0

  Does the below function represent the universally quantified
  statement `∀ n, n ≥ 0` ? If not, provide a definition which
  does represent the statement and explain how it differs
  from `p` (you can use `sorry` for the definition body).

  ```lean
  def p (n : Nat) : Prop := n ≥ 0
  ```

- 0.1

  Definitions for `Eq.refl` and `rfl` are given in this chapter.

  For the followiing example:
  ```lean
  example (f : α → β) (a : α) : (fun x => f x) a = f a := -- ?
  ```

  Complete the body:
    - (a) using `rfl`
    - (b) using Eq.refl using type inference (underscore arg)
    - (c) using Eq.refl with no type inference (explicit term)

  Examining the definitions of `rfl` and `Eq.refl`, what
  difference(s) in how they are defined cause any
  differences in how they are used?

- 0.2

  With `even` defined as:

  ```lean
  def even (n : Nat) : Prop := ∃ k, n = 2 * k
  ```
  , prove:

  (a) That a number added with itself is even:
  ```lean
  example (a : Nat) : even (a + a) := ...
  ```
  (b) That any multiple of an even number is even:
  ```lean
  example (h : even a) (b : Nat): even (a * b) := ...
  ```
  Prove this in the three ways below.

  - (i) Using let-pattern assignment from h
   using an `Exists.intro pattern`
  like `let (Exists.intro ...) := h`. Return an
  `Exists.intro ...` expression.

  - (ii) Using let-pattern assignment from h
  using an anonymous structure pattern
  like `let ⟨...⟩ := h`. Return an anonymous
  structure expression.

  - (iii) Using `Exists.elim`.

## 4.6 Exercises

Do the exercises in [section 4.6](https://leanprover.github.io/theorem_proving_in_lean4/Quantifiers-and-Equality/#Theorem-Proving-in-Lean-4--Quantifiers-and-Equality--Exercises).