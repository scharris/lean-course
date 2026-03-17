/-
Use map to transform list items using a supplied function.
-/

-- Hit F12 with the cursor on the word "map" below to see the definition.
#check List.map
/-
You should then see the definition below.
def List.map (f : α → β) : (l : List α) → List β
  | nil       => nil
  | cons a as => cons (f a) (map f as)

The above is a shorter form of the equivalent definition below.
-- The above form avoids having to include the extra "match ... with" line.
-- Note in the above the matched item is on the other side of the ":" vs below,
-- and there is no ":=".
def List.map (f : α → β) (l : List α) : List β :=
  match l with
  | nil       => nil
  | cons a as => cons (f a) (map f as)
-/
-- Notes: "cons a as" can also be written "a :: as",
--        cons a1 (cons a2 (cons a3 (...))) is also written [a1, a2, a3, ...], and
--        nil can be written []


#eval List.map (fun x => x^2) [1,2,3,4]
-- [1, 4, 9, 16]

-- shorter anonymous function notation using ·
#eval List.map (·^2) [1,2,3,4] -- type the dot as "\cdot"

-- You may also see this variant where map is called as if it's a property on a list value.
#eval [1,2,3,4].map (fun n => n^2)

/- ^ Means List.map (fun n => n^2) [1,2,3,4]
Generally if v is a value of type T and T.f is a function, then
  v.f x1 x2 .. xN
is tranlated to
  T.f x1 ... v ... xN
where v is put at the positiion of the first parameter of type T in T.f's definition.
Here T = List, f = map, x1 = fun n => n^2, v = [1,2,3,4], and
v.f x1 translates to T.f x1 v
-/

-- The types of the items in the input and output lists for map may be different.
-- You can see this in the type of map, where types β and α are independent.
#eval List.map (fun n => s!"number {n}") [4,3,5]
-- ["number 4", "number 3", "number 5"]
