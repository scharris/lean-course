# Theorem Proving in Lean Chapter 3 Exercises

## 3.5

"As an exercise, you might try proving the converse,
that is, showing that em can be proved from dne."

Prove `em` (law of the excluded middle) assuming `dne` (double negation elimination).

Use a `section` to contain your answer, and at the top of the section
define:
```lean
-- Assume double negation elimination.
axiom dne {p : Prop}: ¬¬p → p
```

## 3.7

Do the exercises in [section 3.7](https://leanprover.github.io/theorem_proving_in_lean4/Propositions-and-Proofs/#Theorem-Proving-in-Lean-4--Propositions-and-Proofs--Exercises).