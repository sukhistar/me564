# Import necessary libraries
import numpy as np
import matplotlib.pyplot as plt

# Sukhjit Kaur
# ME564 HW 4

# 4-2.

# Set random seed for reproducibility
# np.random.seed(0)

# Constants
dt = 0.5  # Time step
t_max = 10  # Maximum time
t = np.arange(0, t_max + dt, dt)  # Time vector

# (a) Generate synthetic acceleration data
# True acceleration
a_true = np.sin(t)
# Generate noisy measurements
noise = np.random.normal(0, 0.03, len(t))
a_noisy = a_true + noise

# Plotting acceleration data
plt.figure(figsize=(12, 6))
plt.plot(t, a_true, label='True Acceleration', color='blue')
plt.scatter(t, a_noisy, label='Noisy Acceleration', color='red', s=10)
plt.title('Synthetic Acceleration Data')
plt.xlabel('Time (s)')
plt.ylabel('Acceleration (m/s²)')
plt.legend()
plt.grid()
plt.show()

# (b) Define function for trapezoidal integration
def trapezoidal_integration(data, dt):
    """Calculate the cumulative trapezoidal integral of a data vector."""
    integral = np.zeros_like(data)
    for i in range(1, len(data)):
        integral[i] = integral[i - 1] + 0.5 * (data[i] + data[i - 1]) * dt  # Trapezoidal rule
    return integral

# (c) Analytical expressions for velocity and position
# v(t) = -cos(t) + C, with v(0) = 0 -> C = 1
# x(t) = -sin(t) + C, with x(0) = 0 -> C = 0
v_true = -np.cos(t) + 1  # True velocity
x_true = -np.sin(t)      # True position

# (d) Numerically calculate velocity vectors from noisy acceleration
v_noisy = trapezoidal_integration(a_noisy, dt)
v_noisy_true = trapezoidal_integration(a_true, dt)

# Plotting the velocity vectors
plt.figure(figsize=(12, 6))
plt.plot(t, v_true, label='True Velocity', color='blue')
plt.plot(t, v_noisy, label='Velocity from Noisy Acceleration', color='red', linestyle='--')
plt.plot(t, v_noisy_true, label='Velocity from True Acceleration', color='green', linestyle='--')
plt.title('Velocity Comparison')
plt.xlabel('Time (s)')
plt.ylabel('Velocity (m/s)')
plt.legend()
plt.grid()
plt.show()

# (e) Calculate position vectors from the velocity vectors
x_noisy = trapezoidal_integration(v_noisy, dt)
x_noisy_true = trapezoidal_integration(v_noisy_true, dt)

# Plotting the position vectors
plt.figure(figsize=(12, 6))
plt.plot(t, x_true, label='True Position', color='blue')
plt.plot(t, x_noisy, label='Position from Noisy Velocity', color='red', linestyle='--')
plt.plot(t, x_noisy_true, label='Position from True Velocity', color='green', linestyle='--')
plt.title('Position Comparison')
plt.xlabel('Time (s)')
plt.ylabel('Position (m)')
plt.legend()
plt.grid()
plt.show()

# (f) Re-run this code a few times and provide plots for different instances
# See attached plot outputs 

# (g) Discussion
# The numerically calculated position vectors show noticeable differences when noise is added.
# Without noise, the position closely follows the true analytical position, as expected.
# However, with noise, the position diverges more significantly from the true position.
# This shows the impact of noise on numerical integration - small errors can accumulate
# over time, leading to increasingly inaccurate results.
