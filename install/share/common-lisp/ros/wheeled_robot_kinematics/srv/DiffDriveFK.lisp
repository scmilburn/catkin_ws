; Auto-generated. Do not edit!


(cl:in-package wheeled_robot_kinematics-srv)


;//! \htmlinclude DiffDriveFK-request.msg.html

(cl:defclass <DiffDriveFK-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (action
    :reader action
    :initarg :action
    :type wheeled_robot_kinematics-msg:DiffDriveAction
    :initform (cl:make-instance 'wheeled_robot_kinematics-msg:DiffDriveAction)))
)

(cl:defclass DiffDriveFK-request (<DiffDriveFK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiffDriveFK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiffDriveFK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeled_robot_kinematics-srv:<DiffDriveFK-request> is deprecated: use wheeled_robot_kinematics-srv:DiffDriveFK-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <DiffDriveFK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-srv:pose-val is deprecated.  Use wheeled_robot_kinematics-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <DiffDriveFK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-srv:action-val is deprecated.  Use wheeled_robot_kinematics-srv:action instead.")
  (action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiffDriveFK-request>) ostream)
  "Serializes a message object of type '<DiffDriveFK-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiffDriveFK-request>) istream)
  "Deserializes a message object of type '<DiffDriveFK-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiffDriveFK-request>)))
  "Returns string type for a service object of type '<DiffDriveFK-request>"
  "wheeled_robot_kinematics/DiffDriveFKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveFK-request)))
  "Returns string type for a service object of type 'DiffDriveFK-request"
  "wheeled_robot_kinematics/DiffDriveFKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiffDriveFK-request>)))
  "Returns md5sum for a message object of type '<DiffDriveFK-request>"
  "3cc264aa8c4566fb1b744ec6c2a0d4ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiffDriveFK-request)))
  "Returns md5sum for a message object of type 'DiffDriveFK-request"
  "3cc264aa8c4566fb1b744ec6c2a0d4ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiffDriveFK-request>)))
  "Returns full string definition for message of type '<DiffDriveFK-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%wheeled_robot_kinematics/DiffDriveAction action~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%================================================================================~%MSG: wheeled_robot_kinematics/DiffDriveAction~%float64 left_velocity~%float64 right_velocity~%float64 time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiffDriveFK-request)))
  "Returns full string definition for message of type 'DiffDriveFK-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%wheeled_robot_kinematics/DiffDriveAction action~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%================================================================================~%MSG: wheeled_robot_kinematics/DiffDriveAction~%float64 left_velocity~%float64 right_velocity~%float64 time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiffDriveFK-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiffDriveFK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DiffDriveFK-request
    (cl:cons ':pose (pose msg))
    (cl:cons ':action (action msg))
))
;//! \htmlinclude DiffDriveFK-response.msg.html

(cl:defclass <DiffDriveFK-response> (roslisp-msg-protocol:ros-message)
  ((end_pose
    :reader end_pose
    :initarg :end_pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass DiffDriveFK-response (<DiffDriveFK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiffDriveFK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiffDriveFK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeled_robot_kinematics-srv:<DiffDriveFK-response> is deprecated: use wheeled_robot_kinematics-srv:DiffDriveFK-response instead.")))

(cl:ensure-generic-function 'end_pose-val :lambda-list '(m))
(cl:defmethod end_pose-val ((m <DiffDriveFK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-srv:end_pose-val is deprecated.  Use wheeled_robot_kinematics-srv:end_pose instead.")
  (end_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiffDriveFK-response>) ostream)
  "Serializes a message object of type '<DiffDriveFK-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'end_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiffDriveFK-response>) istream)
  "Deserializes a message object of type '<DiffDriveFK-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'end_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiffDriveFK-response>)))
  "Returns string type for a service object of type '<DiffDriveFK-response>"
  "wheeled_robot_kinematics/DiffDriveFKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveFK-response)))
  "Returns string type for a service object of type 'DiffDriveFK-response"
  "wheeled_robot_kinematics/DiffDriveFKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiffDriveFK-response>)))
  "Returns md5sum for a message object of type '<DiffDriveFK-response>"
  "3cc264aa8c4566fb1b744ec6c2a0d4ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiffDriveFK-response)))
  "Returns md5sum for a message object of type 'DiffDriveFK-response"
  "3cc264aa8c4566fb1b744ec6c2a0d4ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiffDriveFK-response>)))
  "Returns full string definition for message of type '<DiffDriveFK-response>"
  (cl:format cl:nil "geometry_msgs/Pose2D end_pose~%~%~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiffDriveFK-response)))
  "Returns full string definition for message of type 'DiffDriveFK-response"
  (cl:format cl:nil "geometry_msgs/Pose2D end_pose~%~%~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiffDriveFK-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'end_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiffDriveFK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DiffDriveFK-response
    (cl:cons ':end_pose (end_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DiffDriveFK)))
  'DiffDriveFK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DiffDriveFK)))
  'DiffDriveFK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveFK)))
  "Returns string type for a service object of type '<DiffDriveFK>"
  "wheeled_robot_kinematics/DiffDriveFK")