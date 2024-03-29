#!/usr/bin/env python

import rospy
import argparse
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import actionlib
from tf import TransformListener
from tf.transformations import quaternion_from_euler
from tf.transformations import euler_from_quaternion
from tf.transformations import quaternion_multiplyn
from tf.transformations import quaternion_inverse
from geometry_msgs.msg import Twist
import math
import cv2
from sensor_msgs.msg import CompressedImage
import numpy as np
import threading
import copy
import rospkg

#-------------------------------------------------------------------------------
# Object search class
#-------------------------------------------------------------------------------
class ObjectSearch:
  def __init__(self):
    # Navigation
    self.goalStatesText = [
                           'PENDING',
                           'ACTIVE',
                           'PREEMPTED',
                           'SUCCEEDED',
                           'ABORTED',
                           'REJECTED',
                           'PREEMPTING',
                           'RECALLING',
                           'RECALLED',
                           'LOST'
                          ]

    # Vision
    self.image = []
    self.processImage = False
    self.lock = threading.Lock()

    rospack = rospkg.RosPack()
    self.debugImageDir = rospack.get_path('assignment_5_completed') + "/images/debug"
    self.trainImageDir = rospack.get_path('assignment_5_completed') + "/images/train"
    self.trainImageNames = ['cereal', 'soup', 'pringles', 'kinect2', 'milk', 'straws', 'dressing']

    # init node
    rospy.init_node('object_search')

    # Image subscriber and cv_bridge
    self.imageTopic = "/camera/rgb/image_raw/compressed"
    self.imageSub = rospy.Subscriber(self.imageTopic,CompressedImage,self.imageCallback)    
    self.debugImageId  = 0

    # Generate goal poses
    self.goalPoses = []
    self.goalPoses.append((  4.0,  2.6,  1.0))
    self.goalPoses.append((  2.0,  2.4, -3.0))
    self.goalPoses.append((  4.5,  0.7, -0.8))    
    
    # Publisher to manually control the robot (e.g. to stop it)
    self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist)
    
    # Subscribe to the move_base action server, makes client
    self.move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction)
    rospy.loginfo("Waiting for move_base action server...")
    
    # Wait 60 seconds for the action server to become available
    self.move_base.wait_for_server(rospy.Duration(60))
    rospy.loginfo("Connected to move base server")
    
    #for setting up goal things:
    self.goal = MoveBaseGoal()

  #-------------------------------------------------------------------------------
  # Draw matches between a training image and test image
  #  img1,img2 - RGB images
  #  kp1,kp2 - Detected list of keypoints through any of the OpenCV keypoint 
  #            detection algorithms
  #  matches - A list of matches of corresponding keypoints through any
  #            OpenCV keypoint matching algorithm
  def drawMatches(self, img1, kp1, img2, kp2, matches):

    # Create a new output image that concatenates the two images together
    # (a.k.a) a montage
    rows1 = img1.shape[0]
    cols1 = img1.shape[1]
    rows2 = img2.shape[0]
    cols2 = img2.shape[1]

    out = np.zeros((max([rows1,rows2]),cols1+cols2,3), dtype='uint8')

    # Place the first image to the left
    out[:rows1,:cols1] = img1

    # Place the next image to the right of it
    out[:rows2,cols1:] = img2

    # For each pair of points we have between both images
    # draw circles, then connect a line between them
    for mat in matches:

        # Get the matching keypoints for each of the images
        img1_idx = mat.queryIdx
        img2_idx = mat.trainIdx

        # x - columns
        # y - rows
        (x1,y1) = kp1[img1_idx].pt
        (x2,y2) = kp2[img2_idx].pt

        # Draw a small circle at both co-ordinates
        # radius 4
        # colour blue
        # thickness = 1
        cv2.circle(out, (int(x1),int(y1)), 4, (255, 0, 0), 1)   
        cv2.circle(out, (int(x2)+cols1,int(y2)), 4, (255, 0, 0), 1)

        # Draw a line in between the two points
        # thickness = 1
        # colour blue
        cv2.line(out, (int(x1),int(y1)), (int(x2)+cols1,int(y2)), (255, 0, 0), 1)

    # Also return the image if you'd like a copy
    return out

  #-----------------------------------------------------------------------------
  # Image callback
  def imageCallback(self, data):

    # Capture image
    np_arr = np.fromstring(data.data, np.uint8)
    cv_image = cv2.imdecode(np_arr, cv2.CV_LOAD_IMAGE_COLOR)

    # Store it if required
    self.lock.acquire()
    if self.processImage:
      print "Capturing image"
      self.image = copy.deepcopy(cv_image)
      self.processImage = False

    # Show image
    cv2.imshow("Image live feed", cv_image)
    cv2.waitKey(1)

    self.lock.release()

  #-------------------------------------------------------------------------------
  # Capture image, display it and save it to the debug folder
  def  capture_image(self):

    # First get the image to be processed
    self.processImage = True
    while (self.processImage):
      rospy.sleep(0.01)

    # Display image
    self.lock.acquire()
    cv2.imshow("Captured image", self.image)
    self.lock.release()

    # Save image
    cv2.imwrite(self.debugImageDir+"/image_" + str(self.debugImageId) + ".png", self.image)
    self.debugImageId += 1


  #-----------------------------------------------------------------------------
  # Run!
  def run(self):
    this.drawMatches(self, img1, kp1, img2, kp2, matches)
    this.imageCallback(data)
    this.capture_image


    while True:
      client = self.move_base
      goal = self.goal
      for target in self.goalPoses:
        (x,y,z) = target
        goal.target_pose.header.frame_id = 'base_link'
        goal.target_pose.pose = target
        self.goal.target_pose.header.stamp = rospy.Time.now()
        # Let the user know where the robot is going next
        rospy.loginfo("Going to: " + target)
        #send the goal and wait for the base to get there
        client.send_goal_and_wait(goal)
        # Waits for the server to finish performing the action.
        client.wait_for_result()
 	      #then do things ???once at goal???

#-------------------------------------------------------------------------------
# Main
#-------------------------------------------------------------------------------
if __name__ == '__main__':

  objectSearch = ObjectSearch()
  objectSearch.run()
