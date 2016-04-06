#!/usr/bin/python

from assignment_3.map_maker import *
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import OccupancyGrid, Odometry
from assignment_3.args_parser import parse_args
import rosbag
import rospy
import tf

def send_transform(br, translation, rotation, frame1, frame2, time):
    br.sendTransform((translation.x, translation.y, translation.z),
                     (rotation.x, rotation.y, rotation.z, rotation.w),
                     time, frame2, frame1)

bagfile, size, origin, resolution, transform = parse_args()

bag = rosbag.Bag(bagfile)

transformer = tf.TransformerROS()
transformer.setTransform(transform)

m = MapMaker(origin, origin, resolution, size, size, transformer)

rospy.init_node('map_maker')
pub1 = rospy.Publisher('/scan', LaserScan, queue_size=10)
pub2 = rospy.Publisher('/map', OccupancyGrid, queue_size=10)
br = tf.TransformBroadcaster()

r = rospy.Rate(50)
for topic, msg, t in bag.read_messages():
    if 'Odometry' in str(type(msg)):
        m.process_odom(msg)
        pose = msg.pose.pose
        send_transform(br, pose.position, pose.orientation, 'odom', 'base_link', msg.header.stamp)
        pose = transform.transform
        send_transform(br, pose.translation, pose.rotation, transform.header.frame_id,
            transform.child_frame_id, msg.header.stamp)
    elif 'LaserScan' in str(type(msg)):
        m.process_scan(msg)
        pub1.publish(msg)
        pub2.publish(m.grid)
    r.sleep()
    if rospy.is_shutdown():
        break

bag.close()
