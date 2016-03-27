// Generated by gencpp from file wheeled_robot_kinematics/DiffDriveFKResponse.msg
// DO NOT EDIT!


#ifndef WHEELED_ROBOT_KINEMATICS_MESSAGE_DIFFDRIVEFKRESPONSE_H
#define WHEELED_ROBOT_KINEMATICS_MESSAGE_DIFFDRIVEFKRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose2D.h>

namespace wheeled_robot_kinematics
{
template <class ContainerAllocator>
struct DiffDriveFKResponse_
{
  typedef DiffDriveFKResponse_<ContainerAllocator> Type;

  DiffDriveFKResponse_()
    : end_pose()  {
    }
  DiffDriveFKResponse_(const ContainerAllocator& _alloc)
    : end_pose(_alloc)  {
    }



   typedef  ::geometry_msgs::Pose2D_<ContainerAllocator>  _end_pose_type;
  _end_pose_type end_pose;




  typedef boost::shared_ptr< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DiffDriveFKResponse_

typedef ::wheeled_robot_kinematics::DiffDriveFKResponse_<std::allocator<void> > DiffDriveFKResponse;

typedef boost::shared_ptr< ::wheeled_robot_kinematics::DiffDriveFKResponse > DiffDriveFKResponsePtr;
typedef boost::shared_ptr< ::wheeled_robot_kinematics::DiffDriveFKResponse const> DiffDriveFKResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace wheeled_robot_kinematics

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'wheeled_robot_kinematics': ['/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0033e20f904ed6606beffdc6648a8c7b";
  }

  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0033e20f904ed660ULL;
  static const uint64_t static_value2 = 0x6beffdc6648a8c7bULL;
};

template<class ContainerAllocator>
struct DataType< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wheeled_robot_kinematics/DiffDriveFKResponse";
  }

  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose2D end_pose\n\
\n\
\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose2D\n\
# This expresses a position and orientation on a 2D manifold.\n\
\n\
float64 x\n\
float64 y\n\
float64 theta\n\
";
  }

  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.end_pose);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct DiffDriveFKResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wheeled_robot_kinematics::DiffDriveFKResponse_<ContainerAllocator>& v)
  {
    s << indent << "end_pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose2D_<ContainerAllocator> >::stream(s, indent + "  ", v.end_pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WHEELED_ROBOT_KINEMATICS_MESSAGE_DIFFDRIVEFKRESPONSE_H
