#!/usr/bin/env python

import rospy
import time
import argparse
from math import *
import tf
import numpy as np
from geometry_msgs.msg import Twist

def polygonProp():
    #-----------------------------------------------------------------------------
    # Initialize node
    #-----------------------------------------------------------------------------

    rospy.init_node('prop_polygon', anonymous=False)

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

    # Publisher setup
    pub = rospy.Publisher('cmd_vel_mux/input/navi', Twist, queue_size=10)
    listener = tf.TransformListener()
    rate = rospy.Rate(10);  
  
    # Smoothing Parameters
    kp = .2
    kb = .05
    ka = 1.5
    poly_ang = 360 / numSides # exterior angles of polygon  

    # MOVING
    move_cmd = Twist()
  
    while not rospy.is_shutdown():
        for move in range(0, numSides):     
            rospy.loginfo("[+] MOVE: %d"%move)
            try:
                (position, orientation) = listener.lookupTransform("/odom", "/base_footprint", rospy.Time(0))
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                continue

            # CALCULATING GOAL COORDINATES 
            euler = tf.transformations.euler_from_quaternion(orientation)
            theta = euler[2]
            r = np.array([[cos(theta), -sin(theta), 0], [sin(theta), cos(theta), 0], [0, 0, 1]])
            t = np.array([sideLength, 0, poly_ang]) 
            goal = np.dot(r, t)
            # flawed calculations after the first side :/
            
            # rospy.loginfo("GOAL_x: %f" % goal[0])
            #rospy.loginfo("GOAL_y: %f" % goal[1])
            #rospy.loginfo("GOAL_theta: %f" % goal[2])
            
            # GET initial rho VALUES AND LOOP UNTIL CONVERGES
            x = goal[0] - position[0]
            y = goal[1] - position[1]
            p = sqrt(x**2 + y**2)
            a = (-theta + atan2(y, x)) % (2*pi)
            if a > pi:
                a = a - 2*pi

            rospy.loginfo("FIRST RHO: %f" % p)
            rospy.loginfo("FIRST alpha %f" % a)
            #time.sleep(5)

            while p > .05 or a < radians(poly_ang):
                try:
                    (position, orientation) = listener.lookupTransform("/odom", "/base_footprint", rospy.Time(0))
                except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                    continue
                
                rospy.loginfo("MOVE: %d" % move)
                rospy.loginfo("GOAL_x: %f" % goal[0])
                rospy.loginfo("GOAL_y: %f" % goal[1])
                rospy.loginfo("GOAL_theta: %f" % goal[2])
                
                rospy.loginfo("current_x: %f" % position[0]) 
                rospy.loginfo("current_y: %f" % position[1])
                euler_ang = tf.transformations.euler_from_quaternion(orientation)
                theta = euler_ang[2]
                rospy.loginfo("current_theta: %f" % theta)
            
                x = goal[0] - position[0]
                y = goal[1] - position[1]
                p = sqrt(x**2 + y**2)
                a = (-theta + atan2(y, x)) % (2*pi)
                if a > pi:
                    a = a - 2*pi 

                b = -theta - a
                rospy.loginfo("beta: %f" % degrees(b))
                rospy.loginfo("alpha: %f" % degrees(a))

                rospy.loginfo("RHO: %f" % p)

                linear = (kp * p)
                angular = ((ka*a)+(kb*b))
    
                rospy.loginfo("LINEAR speed: %f" % linear)
                rospy.loginfo("ANGULAR speed: %f\n" % angular)
                move_cmd.linear.x = linear
                move_cmd.angular.z = angular
                pub.publish(move_cmd)
                rate.sleep()

            rospy.loginfo("END OF WHILE")
        rospy.loginfo("END FOR LOOP")
        time.sleep(5)
        
    rospy.loginfo("DONE")

#-------------------------------------------------------------------------------
# Main
#-------------------------------------------------------------------------------

if __name__ == '__main__':
    try:
        polygonProp()
    except rospy.ROSInterruptException:
        pass

 


