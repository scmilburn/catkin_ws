// Generated by gencpp from file wheeled_robot_kinematics/DiffDriveFK.msg
// DO NOT EDIT!


#ifndef WHEELED_ROBOT_KINEMATICS_MESSAGE_DIFFDRIVEFK_H
#define WHEELED_ROBOT_KINEMATICS_MESSAGE_DIFFDRIVEFK_H

#include <ros/service_traits.h>


#include <wheeled_robot_kinematics/DiffDriveFKRequest.h>
#include <wheeled_robot_kinematics/DiffDriveFKResponse.h>


namespace wheeled_robot_kinematics
{

struct DiffDriveFK
{

typedef DiffDriveFKRequest Request;
typedef DiffDriveFKResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct DiffDriveFK
} // namespace wheeled_robot_kinematics


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::wheeled_robot_kinematics::DiffDriveFK > {
  static const char* value()
  {
    return "3cc264aa8c4566fb1b744ec6c2a0d4ec";
  }

  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFK&) { return value(); }
};

template<>
struct DataType< ::wheeled_robot_kinematics::DiffDriveFK > {
  static const char* value()
  {
    return "wheeled_robot_kinematics/DiffDriveFK";
  }

  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFK&) { return value(); }
};


// service_traits::MD5Sum< ::wheeled_robot_kinematics::DiffDriveFKRequest> should match 
// service_traits::MD5Sum< ::wheeled_robot_kinematics::DiffDriveFK > 
template<>
struct MD5Sum< ::wheeled_robot_kinematics::DiffDriveFKRequest>
{
  static const char* value()
  {
    return MD5Sum< ::wheeled_robot_kinematics::DiffDriveFK >::value();
  }
  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::wheeled_robot_kinematics::DiffDriveFKRequest> should match 
// service_traits::DataType< ::wheeled_robot_kinematics::DiffDriveFK > 
template<>
struct DataType< ::wheeled_robot_kinematics::DiffDriveFKRequest>
{
  static const char* value()
  {
    return DataType< ::wheeled_robot_kinematics::DiffDriveFK >::value();
  }
  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::wheeled_robot_kinematics::DiffDriveFKResponse> should match 
// service_traits::MD5Sum< ::wheeled_robot_kinematics::DiffDriveFK > 
template<>
struct MD5Sum< ::wheeled_robot_kinematics::DiffDriveFKResponse>
{
  static const char* value()
  {
    return MD5Sum< ::wheeled_robot_kinematics::DiffDriveFK >::value();
  }
  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::wheeled_robot_kinematics::DiffDriveFKResponse> should match 
// service_traits::DataType< ::wheeled_robot_kinematics::DiffDriveFK > 
template<>
struct DataType< ::wheeled_robot_kinematics::DiffDriveFKResponse>
{
  static const char* value()
  {
    return DataType< ::wheeled_robot_kinematics::DiffDriveFK >::value();
  }
  static const char* value(const ::wheeled_robot_kinematics::DiffDriveFKResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WHEELED_ROBOT_KINEMATICS_MESSAGE_DIFFDRIVEFK_H