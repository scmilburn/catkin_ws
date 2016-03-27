#!/usr/bin/env python

import rospy
import argparse
from geometry_msgs.msg import Twist
from math import radians

def polygonOpen():
  #-----------------------------------------------------------------------------
  # Initialize node
  #-----------------------------------------------------------------------------

  rospy.init_node('open_polygon', anonymous=False)

  # This code is required to make sure this node gets simulation time correctly
  simulation = False
  if rospy.has_param('/use_sim_time'):
    if rospy.get_param("/use_sim_time") == True:
      simulation = True

  if simulation:
    rospy.loginfo("Using simulated time.")
    rospy.loginfo("Waiting for the first valid time measurement...")
    t = rospy.Time.now()
    while t == rospy.Time.from_sec(0):
      t = rospy.Time.now()
    rospy.loginfo("Done!")

  else:
    rospy.loginfo("Using real time.")

  #-----------------------------------------------------------------------------
  # Parse command line
  #-----------------------------------------------------------------------------

  parser = argparse.ArgumentParser(description='Polygon Drive Openloop Control')
  parser.add_argument('-d',      default=0.2, type=float)
  parser.add_argument('-n',      default=6, type=int)

  args = parser.parse_args()
  sideLength = args.d
  numSides = args.n

  rospy.loginfo("Polygon parameters:")
  rospy.loginfo("  number of sides: " + str (numSides))
  rospy.loginfo("  side length: " + str(sideLength))

  #-----------------------------------------------------------------------------
  # Drive
  #-----------------------------------------------------------------------------
 
  # Action Publisher 
  pub = rospy.Publisher('cmd_vel_mux/input/navi', Twist, queue_size=10)
  rate = rospy.Rate(10);
  
  # Driving Parameters
  max_forward_vel = .2
  max_turning_vel = .2
  poly_ang = 360 / numSides # exterior angles of polygon
  sec_forward = sideLength/max_forward_vel # t=d/v
  sec_turning = radians(poly_ang)/max_turning_vel
  
  # This line is to account for error in robot
  # In simulation it works fine without this but in reality
  # the robot does not always go in a straight line.
  sec_turning = sec_turning - (sec_turning/30)

  # STRAIGHT COMMAND
  move_cmd = Twist()
  move_cmd.linear.x = max_forward_vel # move forward at max vel
  move_cmd.angular.z = 0
  
  # TURN COMMAND
  turn_cmd = Twist()
  turn_cmd.linear.x = 0
  turn_cmd.angular.z = max_turning_vel; # turning at max vel
  
  # MOVING
  moves = 0
  while moves < numSides:
    rospy.loginfo("Going straight for %f seconds", sec_forward)
    t = rospy.Time.now()
    while rospy.Time.now() - t < rospy.Duration(sec_forward):
        pub.publish(move_cmd)
        rate.sleep()
  
    rospy.loginfo("Turning %d degrees for %f seconds", poly_ang, sec_turning)
    t = rospy.Time.now()
    while rospy.Time.now() - t < rospy.Duration(sec_turning):
        pub.publish(turn_cmd)
        rate.sleep()

    moves = moves + 1

  rospy.loginfo("Should be in start position")

#-------------------------------------------------------------------------------
# Main
#-------------------------------------------------------------------------------

if __name__ == '__main__':
  try:
    polygonOpen()
  except rospy.ROSInterruptException:
    pass
