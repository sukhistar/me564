import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define the analytical solution
def analytical_solution(t):
    return (39/4) * np.exp(-5*t) + (1/4) * np.exp(-t)

# Define the ODE for numerical solution
def ode_system(t, x):
    u = np.exp(t)  # Forcing function
    dxdt = -5*x + u
    return dxdt

# Time range from 0 to 5
t_span = (0, 5)
t_eval = np.linspace(0, 5, 100)

# Initial condition
x0 = [10]

# Solve ODE numerically
sol = solve_ivp(ode_system, t_span, x0, t_eval=t_eval)

# Calculate analytical solution
x_analytical = analytical_solution(t_eval)

# Plotting the results
plt.figure(figsize=(10, 6))
plt.plot(t_eval, sol.y[0], label='Numerical Solution', linestyle='--')
plt.plot(t_eval, x_analytical, label='Analytical Solution', linestyle='-')
plt.title('Solution of the ODE')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.legend()
plt.grid()
plt.xlim(0, 5)
plt.ylim(0, 10)
plt.show()
