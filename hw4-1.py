# Import required libraries
import numpy as np
import matplotlib.pyplot as plt

# Constants for the trajectory
ω1 = 2
ω2 = 26
φ = np.pi / 4

# Function to generate position data
def generate_position_data(dt, t_end=10):
    t = np.arange(0, t_end + dt, dt)  # Create time vector
    x = np.sin(ω1 * t + φ) + np.cos(ω2 * t + φ)  # Calculate position data
    return t, x

# (a) Generate synthetic position data for fine, medium, and coarse time steps
dt_values = [0.0001, 0.05, 0.5]
position_data = {}

for dt in dt_values:
    t, x = generate_position_data(dt)  # Generate position data
    position_data[dt] = (t, x)  # Store the time and position data

# (c) Plot all four x-data vectors generated
plt.figure(figsize=(12, 10))

for i, (dt, (t, x)) in enumerate(position_data.items()):
    plt.subplot(len(dt_values), 1, i + 1)
    plt.plot(t, x, label=f'Position Data (dt={dt})')
    plt.title(f'Position Data for dt = {dt}')
    plt.xlabel('Time (s)')
    plt.ylabel('Position (x)')
    plt.grid()
    plt.legend()

plt.tight_layout()
plt.show()

# (d) Analytical expressions for the derivatives
def analytical_first_derivative(t):
    return ω1 * np.cos(ω1 * t + φ) - ω2 * np.sin(ω2 * t + φ)

def analytical_second_derivative(t):
    return -ω1**2 * np.sin(ω1 * t + φ) - ω2**2 * np.cos(ω2 * t + φ)

# Create a time vector with a small step for true derivatives
dt_smooth = 0.0001
t_smooth = np.arange(0, 10 + dt_smooth, dt_smooth)
true_first_derivative = analytical_first_derivative(t_smooth)
true_second_derivative = analytical_second_derivative(t_smooth)

# (e) Functions to calculate the first and second derivatives using central difference
def first_derivative(data, dt):
    n = len(data)
    derivative = np.zeros(n)
    derivative[1:-1] = (data[2:] - data[:-2]) / (2 * dt)  # Central difference
    # Forward difference for the first point
    derivative[0] = (data[1] - data[0]) / dt
    # Backward difference for the last point
    derivative[-1] = (data[-1] - data[-2]) / dt
    return derivative

def second_derivative(data, dt):
    n = len(data)
    derivative = np.zeros(n)
    derivative[1:-1] = (data[2:] - 2 * data[1:-1] + data[:-2]) / (dt ** 2)  # Central difference
    # Use first derivative for endpoints
    derivative[0] = (data[1] - 2 * data[0] + data[0]) / (dt ** 2)  # Forward approximation
    derivative[-1] = (data[-1] - 2 * data[-2] + data[-2]) / (dt ** 2)  # Backward approximation
    return derivative

# (f) Compute the first derivative of all four x data vectors
first_derivatives = {}
for dt, (t, x) in position_data.items():
    first_derivatives[dt] = first_derivative(x, dt)

# Plot each data vector with the true first derivative
plt.figure(figsize=(12, 10))

for i, (dt, (t, x)) in enumerate(position_data.items()):
    plt.subplot(len(dt_values), 1, i + 1)
    plt.plot(t, first_derivatives[dt], label='Computed First Derivative', color='orange')
    plt.plot(t_smooth, true_first_derivative, label='True First Derivative', linestyle='--', color='blue')
    plt.title(f'First Derivative Comparison for dt = {dt}')
    plt.xlabel('Time (s)')
    plt.ylabel("x'(t)")
    plt.grid()
    plt.legend()

plt.tight_layout()
plt.show()

# (g) Analysis of the coarse sampled example
# The coarse sampled example will likely have a lot of noise and inaccurate results because
# the central difference method relies on having closely spaced points to approximate the derivative.
# A higher accuracy difference scheme could improve results, as it would take into account more points,
# but it still may not recover the true derivative accurately if the sample rate is too low.

# (h) Analysis of the noisy case
# The noisy data leads to inaccuracies in the derivative calculation because the noise introduces random fluctuations
# that can significantly affect the central difference approximation. The central difference method is sensitive
# to noise, and thus using a smoother signal or a method to filter the noise before differentiation would help.

# (i) Calculate the second derivative using two methods
second_derivatives_central = {}
for dt, (t, x) in position_data.items():
    second_derivatives_central[dt] = second_derivative(x, dt)  # Using central difference

# (i ii) Compute second derivative from first derivative
second_derivatives_from_first = {}
for dt, (t, x) in position_data.items():
    first_deriv = first_derivatives[dt]
    second_derivatives_from_first[dt] = second_derivative(first_deriv, dt)

# Plot the second derivatives
plt.figure(figsize=(12, 10))

for i, (dt, (t, x)) in enumerate(position_data.items()):
    plt.subplot(len(dt_values), 1, i + 1)
    plt.plot(t, second_derivatives_central[dt], label='Second Derivative (Central)', color='orange')
    plt.plot(t, second_derivatives_from_first[dt], label='Second Derivative (from First)', linestyle='--', color='green')
    plt.plot(t_smooth, true_second_derivative, label='True Second Derivative', linestyle=':', color='blue')
    plt.title(f'Second Derivative Comparison for dt = {dt}')
    plt.xlabel('Time (s)')
    plt.ylabel("x''(t)")
    plt.grid()
    plt.legend()

plt.tight_layout()
plt.show()

# (j) Analysis of second derivative methods
# The second derivative calculated from the first derivative will generally have more error because it is
# subject to the inaccuracies of the first derivative computation. Additionally, taking derivatives of noisy data
# amplifies the error, leading to a less accurate representation of the true second derivative.
