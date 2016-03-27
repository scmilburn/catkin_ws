#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist, Vector3
import sys

#rosservice call kill turtle1
#rosservice call spawn 5 6 3 turtle1
#rosservice call spawn 5 6 0 turtle2

def draw():
    i = 0
    pub = rospy.Publisher('turtle1/cmd_vel', Twist, queue_size=1)
    pub2 = rospy.Publisher('turtle2/cmd_vel', Twist, queue_size=1)
    rospy.init_node('send_vel_cmd', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    
    while i < 25: #not rospy.is_shutdown():
        top = Twist(Vector3(2.0, 0, 0), Vector3(0, 0, -1.3))
        bottom = Twist(Vector3(2.0, 0, 0), Vector3(0, 0, -1.3))
        rospy.loginfo(top)
        rospy.loginfo(bottom)
        pub.publish(top)
        pub2.publish(bottom)
        i+=1
        rate.sleep()

if __name__ == '__main__':
    try:
        draw()
    except rospy.ROSInterruptException:
        pass
