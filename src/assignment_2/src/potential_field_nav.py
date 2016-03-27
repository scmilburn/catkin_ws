#!/usr/bin/env python

import math
import numpy as np               # Linear algebra
import matplotlib.pyplot as plt  # Plotting

#-------------------------------------------------------------------------------
def GoToGoal(x_g, y_g):

    #-----------------------------------------------------------------------------
    # Initialization (you don't have to modify anything here)
    #-----------------------------------------------------------------------------

    # Define a map
    nX = 100
    nY = 100
    X, Y = np.meshgrid(np.linspace(0,nX), np.linspace(0,nY))

    # Define start position
    x_0 = 20
    y_0 = 20

    #-----------------------------------------------------------------------------
    # Calculate potential field for each cell of the map
    #-----------------------------------------------------------------------------
    
    delta_x = x_g - x_0
    delta_y = y_g - y_0

    d = math.sqrt((x_g-x_0)**2 + (y_g-y_0)**2)
    angle = math.atan2()
    print "Distance between start and goal: %f" % d
    

    U = []
    V = []

    # A dummy potential field
    U = np.cos(X)     
    V = np.sin(Y)

    #-----------------------------------------------------------------------------
    # Find the robot path using the potential field
    #-----------------------------------------------------------------------------
    # Your final path should be represented as an ordered list of cell coordinates
    # the robot visits

    path = []
    path.append([x_0, y_0])

    
    for x in range(30):
        path.append([x_0+x+1, y_0])
    for y in range(21):
        path.append([x_0+30, y_0+y+1])

    #-----------------------------------------------------------------------------
    # Plot results (you don't have to modify anything here)
    #-----------------------------------------------------------------------------

    # Plot potential field. Every nth cell will be plotted
    nth = 1
    plt.figure()
    Q = plt.quiver(X[::nth, ::nth], Y[::nth, ::nth], U[::nth, ::nth], V[::nth, ::nth],
        pivot='mid', units='width')
    plt.axis([-5, 105, -5, 105])
    plt.title('Robot path')
    plt.xlabel('X')
    plt.xlabel('Y')

    # Plot Path
    path_x = []
    path_y = []
    for i in range(len(path)-1):
        path_x.append(path[i][0])
        path_y.append(path[i][1])

    plt.plot(path_x, path_y, 'r', linewidth=4)

    # Plot Start and goal positions
    plt.plot([x_0], [y_0], 'bo', markersize=10)
    plt.plot([x_g], [y_g], 'go', markersize=10)
    plt.plot([50], [20], 'yo', markersize=5)
    plt.plot([80], [35], 'yo', markersize=5)

    # Show plot
    plt.show()


#-------------------------------------------------------------------------------
if __name__ == '__main__':
    x_g = 80#50
    y_g = 20#40
    GoToGoal(x_g, y_g)
