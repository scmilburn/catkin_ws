from assignment_3.geometry import *
from math import pi
import random

import matplotlib.pyplot as plt
import matplotlib.patches as patches

#-------------------------------------------------------------------------------
# Generates a random pose in the map (in real world coordinates)
def random_particle(the_map):
  found = False
  while not found:
    x = random.uniform(0, the_map.info.width)
    y = random.uniform(0, the_map.info.height)
    ID = to_index(int(x), int(y), the_map.info.width)
    if the_map.data[ID] == 0:
        found = True
  x = the_map.info.origin.position.x + x * the_map.info.resolution
  y = the_map.info.origin.position.y + y * the_map.info.resolution
  theta = random.uniform(-pi, pi)

  return (x, y, theta)

#-------------------------------------------------------------------------------
# Generates a new particle from an old one by adding noise to it
def new_particle(particle, spatial_var, angle_var):
  x = random.gauss(particle[0], spatial_var)
  y = random.gauss(particle[1], spatial_var)
  theta = random.gauss(particle[1], angle_var)

  return (x,y,theta)
    
#-------------------------------------------------------------------------------
# Resamples the particles.
# NOTE: particle weights are not normalized i.e. it is not guaranteed that the 
# sum of all particle weights is 1.
def resample(particles_weighted, n_particles):

  particles = []
  weight = 0
  for p in particles_weighted:
      weight += particle[0]
  
  r = random.uniform(0, 1/float(n_particles))
  w = particles_weighted[0][0]/weight
  i = 0
  for p in range(n_particles):
    U = r + float(p)/float(n_particles)
    while U > w:
        i += 1
        w += particles_weighted[i][0]/weight
    particle = particles_weighted[i][1]
    particles.append(new_particle(particle, 0.05, pi/8))
  return particles      

# ----------------------------------------------------------------------------
# Draw an occupancy grid
def draw_occupancy_grid(the_map, ax):

  for cellId in range(len(the_map.data)):

    # Get cell grid coordinates
    x = cellId // the_map.info.width
    y = cellId %  the_map.info.width

    # Get cell world coordinates
    (x, y) = to_world ( x, y,
                    the_map.info.origin.position.x,
                    the_map.info.origin.position.y,
                    the_map.info.width, the_map.info.height,
                    the_map.info.resolution)


    # Add patch
    res = the_map.info.resolution
    if the_map.data[cellId] == 100:
      patch = patches.Rectangle ( (x-res/2, y-res/2), res, res, color='k', alpha=0.5)
      ax.add_patch(patch)
    elif the_map.data[cellId] == 0:
      patch = patches.Rectangle ( (x-res/2, y-res/2), res, res, color='b', alpha=0.5)
      ax.add_patch(patch)

  None

# ----------------------------------------------------------------------------
# Draw scored particles. If no scores were assigned to the particles (i.e. all
# particles have score 0) then particles are drawn with score of 0.1
def draw_particles_scored(particles_weighted):

  # Check if scores are unassigned
  scoresAssigned = False
  for particle in particles_weighted:
    if particle[0] != 0.0:
      scoresAssigned  = True

  # Draw particles
  for ptclId in range(len(particles_weighted)):
    (x, y, theta) = particles_weighted[ptclId][1]

    mSize = 0.1
    if scoresAssigned:
      mSize = particles_weighted[ptclId][0] * 20

    plt.plot( [x,  x - math.sin(theta)*0.5],
          [y,  y + math.cos(theta)*0.5],
          'g', linewidth=mSize / 5)
    plt.plot(x, y, 'ro', markersize=mSize, markeredgecolor='r')
  None

#-------------------------------------------------------------------------------
# This function is called each interation after calculating the scores of the
# particles. Use it for debugging
def debug_call(particles_weighted, the_map):

  debug = False

  if not debug:
    return 

  # Initialize figure
  my_dpi = 96
  plt.figure(1, figsize=(800/my_dpi, 800/my_dpi), dpi=my_dpi)
  plt.cla()
  plt.xlim ( the_map.info.origin.position.x, the_map.info.origin.position.x + the_map.info.width )
  plt.ylim ( the_map.info.origin.position.y, the_map.info.origin.position.y + the_map.info.height )
  plt.gca().set_aspect('equal', adjustable='box')
  plt.xlabel('X world')
  plt.xlabel('Y world')
  ax = plt.axes()

  # Draw map
  draw_occupancy_grid(the_map, ax)

  # Draw particles
  draw_particles_scored(particles_weighted)

  # Show plot
  plt.draw()

  pause = True
  if pause:
    k = plt.waitforbuttonpress(1)
    while not k:
      k = plt.waitforbuttonpress(1)
  else:
    plt.waitforbuttonpress(1e-6)

None  
