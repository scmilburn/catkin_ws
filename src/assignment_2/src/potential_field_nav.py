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

    d = math.sqrt(delta_x**2 + delta_y**2)
    angle = math.atan2(delta_y, delta_x)
    print "Distance between start and goal: %f" % d
    print "Angle to goal: %f" % math.degrees(angle)

    M = X.copy()
    N = Y.copy()
    
    GX = X.copy()
    GX.fill(x_g)
    
    GY = Y.copy()
    GY.fill(y_g)
    
    # constant is large because do not square
    k_att = 10
    K = X.copy()
    K.fill(k_att)
    
    # Attractive Potential
    U_att = np.multiply(K, np.subtract(GX, M))
    V_att = np.multiply(K, np.subtract(GY, N))
    
    #setting up ndarray of same size
    urep1 = X.copy()
    urep2 = X.copy()
    vrep1 = Y.copy()
    vrep2 = Y.copy()
    
    obs1 = (50,20)
    obs2 = (80,35)
    r = 5
    
    #using two different repulsive fields for the two obstacles

    cond = [(urep1>obs1[0]-r)&(urep1<obs1[0]+r)&(vrep1>obs1[1]-r)&(vrep1<obs1[1]+r)]
    choice = [700] #[.5((1/(obs1[0]-urep1))-(1/r)**2)]
    U_rep1 = np.select(cond, choice)

    cond = [(urep1>obs1[0]-r)&(urep1<obs1[0]+r)&(vrep1>obs1[1]-r)&(vrep1<obs1[1]+r)]
    choice = [700] #[.5((1/(obs1[1]-vrep1))-(1/r)**2)]
    V_rep1 = np.select(cond, choice)
    
    cond = [(urep2>obs2[0]-r)&(urep2<obs2[0]+r)&(vrep2>obs2[1]-r)&(vrep2<obs2[1]+r)]
    choice = [700] #[.5((1/(obs2[0]-urep2))-(1/r)**2)]
    U_rep2 = np.select(cond, choice)
    
    cond = [(urep2>obs2[0]-r)&(urep2<obs2[0]+r)&(vrep2>obs2[1]-r)&(vrep2<obs2[1]+r)]
    choice = [700] #[.5((1/(obs2[1]-vrep2))-(1/r)**2)]
    V_rep2 = np.select(cond, choice)


    # Combining all potential fields 
    U_rep = np.add(U_rep1, U_rep2)
    V_rep = np.add(V_rep1, V_rep2)
    U = np.add(U_att, U_rep)
    V = np.add(V_att, V_rep)

    #-----------------------------------------------------------------------------
    # Find the robot path using the potential field
    #-----------------------------------------------------------------------------
    # Your final path should be represented as an ordered list of cell coordinates
    # the robot visits

    path = []
    path.append([x_0, y_0])
    
    Fx = np.gradient(U)
    Fy = np.gradient(V)
    
    # cant figure out following vectors so just doing dumb path
    # need to be following gradient
    for y in range(delta_y): 
        path.append([x_0, y_0+y+1])

    for x in range(delta_x):
        path.append([x_0+x+1, y_0+delta_y])

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
    y_g = 50#40
    GoToGoal(x_g, y_g)
