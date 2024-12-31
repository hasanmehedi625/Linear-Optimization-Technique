#Linear optimization problem Code
if (!require("lpSolve")) install.packages("lpSolve")
library(lpSolve)

# Coefficients for the objective function (same as before)
c <- c(100, 100, 100, 50, 50, 50, 30, 30, 30)

# Coefficients for the constraints (Transportation, Staff Hours, and Receiving Capacity)
A <- matrix(c(
  # Transportation Capacity (each term multiplied by 2, 1, and 3 respectively)
  2, 2, 2, 1, 1, 1, 3, 3, 3,  
  # Medical Staff Hours (each term is 1, 0.5, and 0.25 respectively)
  1, 1, 1, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25,
  # Receiving Capacity for Medical Supplies (x_1 <= 20, x_2 <= 30, x_3 <= 50)
  1, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 1, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 1, 0, 0, 0, 0, 0, 0,
  # Receiving Capacity for Food Rations (y_1 <= 40, y_2 <= 50, y_3 <= 60)
  0, 0, 0, 1, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 1, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 1, 0, 0, 0,
  # Receiving Capacity for Shelter Materials (z_1 <= 30, z_2 <= 40, z_3 <= 50)
  0, 0, 0, 0, 0, 0, 1, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 1, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 1
), nrow = 11, byrow = TRUE)

# Right-hand side (maximum resources available)
b <- c(100, 300, 20, 30, 50, 40, 50, 60, 30, 40, 50)

# Solve the linear programming problem using lp function
solution <- lp("max", c, A, "<=", b)

# Print the solution
x=solution$solution
Z=sum(x*c)