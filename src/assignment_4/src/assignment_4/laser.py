from math import sin, cos, atan2, hypot, exp, floor
from assignment_3.geometry import to_index, to_world, to_grid

# ------------------------------------------------------------------------------
# Given two integer coordinates of two cells return a list of coordinates of
# cells that are traversed by the line segment between the centers of the input
# cells

def distance(x0, y0, x1, y1):
    return hypot(x1-x0, y1-y0)

def inbounds(cell, the_map):
    if cell[0] < 0 or cell[0] > the_map.info.width - 1 or cell[1] < 0 or cell[1] > the_map.info.height - 1:
        return False
    return True

def line_seg(x0, y0, x1, y1):
    points = []

    # Setup initial conditions
    dx = abs(x1 - x0)
    dy = abs(y1 - y0)
    x = x0
    y = y0
    n = 1 + dx + dy
    x_inc = 1 if x1 > x0 else -1
    y_inc = 1 if  y1 > y0  else -1
    error = dx - dy
    dx *= 2
    dy *= 2

    # Traverse
    while n > 0:
        points.append((x, y))

        if error >= 0:
            x += x_inc
            error -= dy
        else:
            y += y_inc
            error += dx

        n-=1

    # Return
    return points

#-------------------------------------------------------------------------------
# Given a ray find the coordinates of the first occupied cell in a ray
# Parameters:
#   x0, y0    map coordinates of a cell containing ray origin
#   angle     angle of a ray
#   the_map   map
# Return:
#    first occupied cell
def ray_tracing(x0, y0, angle, the_map):
    # diagonal across map 
    max_range = distance(0.0, 0.0, the_map.info.width, the_map.info.height)
    
    # endpoints and ray cells
    xf = x0 + the_map.info.resolution / 2 + max_range * cos(angle)
    yf = y0 + the_map.info.resolution / 2 + max_range * sin(angle)
    ray_cells = line_seg(int(floor(x0)), int(floor(y0)), int(floor(xf)), int(floor(yf)))
    
    for c in ray_cells:
        if not inbounds(c, the_map):
            return None
        
        # occupied?    
        index = to_index(c[0], c[1], the_map.info.width)
        if the_map.data[index] is 100:
            return c

#-------------------------------------------------------------------------------
# Returns a laser scan that the robot would generate from a given pose in a map
# Parameters:
#   x0, y0      robot position in map coordinates
#   theta       robot orientation
#   min_angle   minimum angle of laserscan
#   increment   laserscan increment
#   n_readings  number of readings in a laserscan
#   max_range   maxiimum laser range
#   the_map     map
# Return:
#   array of expected ranges
def expected_scan(x, y, theta, min_angle, increment, n_readings, max_range, the_map):

    exp_ranges = []
    for r in range(n_readings):
        angle = theta + min_angle + r * increment
    
        # endpoint will never be greater than max because it is already checked
        end =  ray_tracing(x, y, angle, the_map)
        if end is None:
            exp_ranges.append(max_range)
            continue
        exp_ranges.append(distance(x, y, end[0], end[1]) * the_map.info.resolution)

    return exp_ranges

#-------------------------------------------------------------------------------
# Computes the similarity between two laserscan readings.
# Parameters:
#   ranges0     first scan
#   ranges1     second scan
#   max_range   maximum laser range
# Return:
#   similarity score between two scans
def scan_similarity(ranges0, ranges1, max_range):
    
    simscore = 0
    for i in range(len(ranges0)):
        diff = abs(ranges0[i] - ranges1[i])
        simscore += diff

    simscore = 1 - simscore/ max_range / len(ranges0)
    return simscore ** 2
