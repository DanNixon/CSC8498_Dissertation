# Quick hacky script to generat Gaussian plots to demonstrate to goal of the
# Kalman filter

import matplotlib.pyplot as plt
import numpy as np
import matplotlib.mlab as mlab
import math

def gauss_prod(g1, g2):
    m = ((g1[0] * g2[1]) + (g2[0] * g2[1])) / (g2[1] + g2[1])
    s = (g2[1] * g2[1]) / (g2[1] + g2[1])

    return (m, s)

gaussians = [(12, 6), (10, 4), (11, 15), (8, 2)]

x = np.linspace(0, 20, 100)

s = (1, 0)
for i, g in enumerate(gaussians):
    plt.plot(x, mlab.normpdf(x, g[0], math.sqrt(g[1])))
    if i == 0:
        s = g
    else:
        s = gauss_prod(s, g)

plt.plot(x, mlab.normpdf(x, s[0], math.sqrt(s[1])), '--')

plt.show()

