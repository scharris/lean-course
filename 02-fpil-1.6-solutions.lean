-- 1
def last : (l : List α) -> Option α
| [] => none
| x::[] => x
| _::xs => last xs

#eval last [1,2]
#eval last [1]
#eval last ([] : List String)

-- 2
def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
match xs with
| [] => none
| x::xs => if predicate x then some x else List.findFirst? xs predicate

#eval List.findFirst? [1,2,3,4] (fun n => Nat.mod n 2 == 0) -- some 2
#eval List.findFirst? [1,2,3,4] (fun n => Nat.mod n 9 == 0) -- none

-- 3
def Prod.switch {α β : Type} (pair : α × β) : β × α := (pair.2, pair.1)
#eval Prod.switch (1, "s") -- ("s", 1)

-- 4
inductive PetName where
  | dog (name : String) : PetName
  | cat (name : String) : PetName

open PetName

def animals := [dog "Spot", cat "Tiger", dog "Fifi", dog "Rex", cat "Floof"]

def howManyDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | dog _ :: morePets => howManyDogs morePets + 1
  | cat _ :: morePets => howManyDogs morePets

#eval howManyDogs animals

-- 5
def zip {α β : Type} (l1 : List α) (l2 : List β) : List (α × β) :=
  match l1, l2 with
  | [], _ => []
  | _, [] => []
  | (x::xs), (y::ys) => (x,y) :: zip xs ys

-- 6
def take (n : Nat) (l : List α) : List α :=
  match n, l with
  | _, [] => []
  | 0, _ => []
  | (Nat.succ pn), x::xs => x :: take pn xs

#eval take 3 ["bolete", "oyster"] -- ["bolete", "oyster"]
#eval take 1 ["bolete", "oyster"]
#eval take 1 ([] : List String)

-- 7
def distProdOverSum : α × (β ⊕ γ) → (α × β) ⊕ (α × γ) :=
  fun (a, bog) =>
    match bog with
    | Sum.inl b => Sum.inl (a, b)
    | Sum.inr g => Sum.inr (a, g)

-- 8
def typeLevelDouble : Bool × α → α ⊕ α :=
  fun (b, a) => -- can interpret b as "put to left?"
    match b with
    | true => Sum.inl a
    | false => Sum.inl a

-- (additional exercises)

-- 9
def zipWith (f : α → β → γ) (l1 : List α) (l2 : List β) : List γ :=
  match l1, l2 with
  | [], _ => []
  | _, [] => []
  | (x::xs), (y::ys) => f x y :: zipWith f xs ys

structure Point where
  x : Nat
  y : Nat
deriving Repr

#eval zipWith Point.mk [1,2] [10,20,30]

-- 10
def count (pred : α → Bool) : List α → Nat
| [] => 0
| x::xs => if pred x then 1 + count pred xs else count pred xs

#eval count (fun n => Nat.mod n 2 == 0) [1,2,3,4,5] -- 2
#eval count (fun n => Nat.mod n 9 == 0) [1,2,3,4,5] -- 0

-- 11
def sumNats : List Nat → Nat
| [] => 0
| x::xs => x + sumNats xs

#eval sumNats [1,2,3] -- 6
#eval sumNats ([] : List Nat) -- 0

-- 12
def maxNat : List Nat → Option Nat
| [] => none
| x::xs =>
    match maxNat xs with
    | none => some x
    | some m => if x < m then some m else some x

def minNat : List Nat → Option Nat
| [] => none
| x::xs =>
    match minNat xs with
    | none => some x
    | some m => if x < m then some x else some m

#eval maxNat [5,1,2,7,3] -- some 7
#eval maxNat ([] : List Nat) -- none
#eval minNat [5,1,2,7,3] -- some 1
#eval minNat ([] : List Nat) -- none

-- 13

def sum [Zero α] [Add α] : List α → α
| [] => 0
| x::xs => x + sum xs

def max [Ord α] : List α → Option α
| [] => none
| x::xs => match max xs with
    | none => some x
    | some m =>
        if compare x m = Ordering.lt then some m
        else some x

def min [Ord α] : List α → Option α
| [] => none
| x::xs => match min xs with
    | none => some x
    | some m =>
        if compare x m = Ordering.lt then some x
        else some m

#eval sum [5,1,2,7,3] -- 18
#eval sum [5.0,1.0] -- 6.000000
#eval sum ([] : List Nat) -- 18

#eval max [5,1,2,7,3] -- some 7
#eval max ["abc", "ab", "i", "cd"] -- some "i"
#eval max ([]: List Nat) -- none

#eval min [5,1,2,7,3] -- some 1
#eval min ["abc", "ab", "i", "cd"] -- some "ab"
#eval min ([] : List String) -- none
