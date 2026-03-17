# Car Comparison Exercises
1. Define a **Car** data type to contain the car's
   *name*, *mpg*, and *price*.
1. Define a **Context** data type, containing the
   miles driven per year and the cost of gas per gallon.
   An instance of this type represents context
   information needed for our calculations.
1. Define two cars
   - **prius**: A Prius with *mpg* of 57, and *price*
     of 30000.
   - **corolla**: having *mpg* of 35 and *price* of 24000.
1. Define **cars** to be a list of the above cars.
1. Create a **totalCost** function, accepting parameters:
    - *car*
    - *gasCostPerGallon*
    - *milesDriven*

   Return the total cost as the purchase price plus the cost of gas consumed.

   *Hint: calculate gallons consumed, then the consumed gas cost, add that to
   total price as the result.
   Use "let" clauses to define the first two intermediate calculations.*
1. Define a function **totalCostAtYears** which accepts
    - a driving context
    - a car
    - a list timepoints measured in years

   Return the list of the car's total costs at the given
   timepoints.

   *Hint: First calculate the miles at each timepoint,
   using List.map, saving the result to a name via
   "let".*

   *Then use List.map acting on the miles list to form
    the final result. Pass to map an anonymous
    function (fun ... => ...) which uses the totalCost
    function on its right hand side. The anonymous
    function should adapt the totalCost function to
    its environment by filling in params from
    its surroundings that don't come from the list
    being mapped.*
1. Define a driving context **context1** with 15K miles
   driven per year and gas price of 2.90.
1. Compute **totalCostsAtYears** at years [1,5,10]
   for each car individually using **context1**
   as driving context.
   Use #eval to show results of the function call.
1. Compute **totalCostsAtYears** at years [1,5,10]
   for all cars at once (one function call)
   using **context1**.
1. The previous calculation returns a list of list
   of Float, so it's hard to see which cars
   have which costs. This would be a bigger problem
   of course if we had more than two cars.

   So adjust the calculation in the last exercise to
   pair each car's costs list with the car name
   at front.
1. Do the same calculation as the previous exercise,
   this time with a new driving context **context2**
   where gas is $5/gal and miles driven per year is
   20K.

   *The Prius should be cheaper in the second
   driving context at 10 years, but not in the first.*
1. When doing multiple calculations with a
   given context, it can be convenient to partially
   apply the function **totalCostsAtYears** to a
   driving context and saving the result as a
   new function, say **costs1** or **costs2**.

   Define **costs1** in this way and then redo one of
   the **context1** calculations from above using
   **costs1** instead of **totalCostsAtYears**.
