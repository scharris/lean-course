structure Car where
  name: String
  mpg: Float
  price: Float

/-- Driving context -/
structure Context where
  milesDrivenPerYear: Float
  gasCostPerGal: Float

def prius: Car := { name := "Prius", mpg := 57, price := 30000 }
def corolla : Car := { name := "Corolla", mpg := 35, price := 24000 }

def cars : List Car := [ prius, corolla ]

/-- Calculate the total cost, including initial price plus gas costs, for a car
  at a specific gas price and miles traveled. -/
def totalCost (car : Car) (gasCostPerGal: Float) (miles: Float): Float :=
  let gallons := miles / car.mpg
  let gasCost := gallons * gasCostPerGal
  car.price + gasCost

-- Equivalent to the above, written in longer more explicit form (matter of taste).
def totalCostsAtYears (ctx : Context) (car : Car) (yearTimepoints: List Float): List Float :=
 let milesAtTimepoints := List.map (fun years => years * ctx.milesDrivenPerYear) yearTimepoints
 List.map (fun miles => totalCost car ctx.gasCostPerGal miles) milesAtTimepoints

-- Do some calculations with a driving context of $2.90/gal and 15K mi/y.
def context1 : Context := { gasCostPerGal := 2.90, milesDrivenPerYear := 15000 }

-- E1: Evaluate costs at 1, 5, and 10 years of driving.
#eval totalCostsAtYears context1 prius [1,5,10]
#eval totalCostsAtYears context1 corolla [1,5,10]


-- Calculate costs at the timepoints for all cars.
#eval List.map (fun car => totalCostsAtYears context1 car [1,5,10]) cars
-- which can also be written:
#eval cars.map (fun car => totalCostsAtYears context1 car [1,5,10])

-- OK but it is too hard to know which car is which in the results.
-- We need the same calculation but with each car's name paired with its cost list:
#eval cars.map (fun car => (car.name, totalCostsAtYears context1 car [1,5,10]))

-- The Prius still costs more at 10 years with context1.

-- What about with gas at $5/gal and driving 20K mi/y?
-- Let's define a second context and calculate with that instead.

def context2 : Context := { gasCostPerGal := 5.00, milesDrivenPerYear := 20000 }

#eval cars.map (fun car => (car.name, totalCostsAtYears context2 car [1,5,10]))

-- The prius comes out ahead at 10 years in this second context.

-- Partially applying a function to context argument(s)
-- If we want gas price and miles driven per year to be assumed for some
-- calculations, we can make a version of the calculation function(s) with
-- some of its leading parameters fixed, which is a function of the remaining
-- parameters (currying):
def costs1 := totalCostsAtYears context1
-- Then calculations don't need the context argument to be passed around.
#eval costs1 prius [1,5,10]
#eval costs1 corolla [1,5,10]
