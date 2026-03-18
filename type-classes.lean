section type_classes

-- We want to be able to sum the items in a list when the item type supports addition.

-- So we define ...
def sumNats (l: List Nat) : Nat :=
  match l with
  | [] => 0
  | x::xs => x + sumNats xs

def sumFloats (l: List Float) : Float :=
  match l with
  | [] => 0
  | x::xs => x + sumFloats xs

-- The definitions are essentially identical.
-- Do we have to do this for each type that should be summable?
-- Like ints of various sizes, rationals, polynomials, etc?

-- Can we not define a sum for any type?
/-
def sum (l: List α) : α := -- does not type check
  match l with
  | [] => 0
  | x::xs => x + sum xs

This fails type-checking because there's no gaurantee that α has
an addition operation and a zero element.

Type Classes

Type classes allow types to be registered as having certain
operations or elements available. The word "class" in math
usually means a set whose elements are already sets - which
is one view of types, as sets of their possible values. So a
type class represents a set or class of types that have some
common operations. These operations are available under the
same standard name and type signature through the type class.

Type classes will allow us to write generic functions, meaning
functions that work for many types at once, but which can assume
that some operations are present for each instance type.
-/

-- This declares that when α is in the type class Addable, then
-- it is guaranteed to have a "plus" function of type α → α → α.
class Addable (α : Type) where
  plus : α → α → α -- addition for type α

-- Any type put into the HasZero type class will have a zero element.
class HasZero (α : Type) where
  zero: α -- zero element of type α. The expected type is inferred from usage context.

-- Now we can define a proper sum function that works for any type
-- which is in both the Addable and HasZero type classes.
-- The [X α]'s before the params are declaring that the type α must be
-- in those type classes for this funtion to be used.
def mysum [Addable α] [HasZero α] (l: List α) : α :=
  match l with
  | [] => HasZero.zero
  | x::xs => Addable.plus x (mysum xs)

/-
Now we register Nat and Float to be in these classes. When
registering, each operation/element must be tied to a specific
value appropriate for the type, which must match the signature
in the type class definition.

Note that the function mysum above can be defined regardless of
whether any types, or which types, are in classes Addable and HasZero.
New types (such as your own experimental number type) could be put
in these types classes independently of the definition of mysum, and
mysum will still work with them. This independence of definitions
that use type classes from the type class instances themselves
(the putting of types into the type classes) is a very powerful
feature.
-/

instance : Addable Nat where
  plus := fun (a b : Nat) => a + b -- same as Nat.add

instance : HasZero Nat where
  zero := (0 : Nat)

instance : Addable Float where
  plus := Float.add

instance : HasZero Float where
  zero := (0 : Float)

-- This allows us to sum Nats and Floats:
#eval mysum [1,2,3,4]
-- 10
#eval mysum [1.0, 2.0, 3.0, 4.0]
-- 10.000000

/-
We didn't actually have to define the above classes, because the Lean
standard library already defines them under the names "Add" and "Zero".
The standard versions have the advantage of working with the usual
"0" and "+" syntax for numbers.
-/
def sum [Add α] [Zero α] (l: List α) : α :=
  match l with
  | [] => 0 -- same as Zero.zero
  | x::xs => x + sum xs -- same as Add.add x (sum xs)


/- TYPE CLASSES ARE A MAJOR MEANS OF EXPRESSING ABSTRACTIONS

Many important mathematical abstractions are represented as type classes
in Lean, and they are used heavily in proofs. For example the type
class Field is defined at

https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Field/Defs.html#Field)

class Field(K : Type u) extends CommRing K, DivisionRing K : Type u

Here field is extending two other type classes (type classes can extend
others) without adding any new operations (it says a field is a
commutative ring with division). Rings are used heavily in modern
algebra, as are fields, and fields are used heavily in the study of
analysis/calculus (where the real numbers are the one and only
"complete ordered field"), in linear algebra, and many other domains.
-/

end type_classes
