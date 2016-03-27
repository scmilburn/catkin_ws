; Auto-generated. Do not edit!


(cl:in-package wheeled_robot_kinematics-srv)


;//! \htmlinclude DiffDriveIK-request.msg.html

(cl:defclass <DiffDriveIK-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (end_pose
    :reader end_pose
    :initarg :end_pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass DiffDriveIK-request (<DiffDriveIK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiffDriveIK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiffDriveIK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeled_robot_kinematics-srv:<DiffDriveIK-request> is deprecated: use wheeled_robot_kinematics-srv:DiffDriveIK-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <DiffDriveIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-srv:pose-val is deprecated.  Use wheeled_robot_kinematics-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'end_pose-val :lambda-list '(m))
(cl:defmethod end_pose-val ((m <DiffDriveIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-srv:end_pose-val is deprecated.  Use wheeled_robot_kinematics-srv:end_pose instead.")
  (end_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiffDriveIK-request>) ostream)
  "Serializes a message object of type '<DiffDriveIK-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'end_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiffDriveIK-request>) istream)
  "Deserializes a message object of type '<DiffDriveIK-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'end_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiffDriveIK-request>)))
  "Returns string type for a service object of type '<DiffDriveIK-request>"
  "wheeled_robot_kinematics/DiffDriveIKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveIK-request)))
  "Returns string type for a service object of type 'DiffDriveIK-request"
  "wheeled_robot_kinematics/DiffDriveIKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiffDriveIK-request>)))
  "Returns md5sum for a message object of type '<DiffDriveIK-request>"
  "72b62ffb846e210a0b026254440e0b70")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiffDriveIK-request)))
  "Returns md5sum for a message object of type 'DiffDriveIK-request"
  "72b62ffb846e210a0b026254440e0b70")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiffDriveIK-request>)))
  "Returns full string definition for message of type '<DiffDriveIK-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%geometry_msgs/Pose2D end_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiffDriveIK-request)))
  "Returns full string definition for message of type 'DiffDriveIK-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%geometry_msgs/Pose2D end_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiffDriveIK-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'end_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiffDriveIK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DiffDriveIK-request
    (cl:cons ':pose (pose msg))
    (cl:cons ':end_pose (end_pose msg))
))
;//! \htmlinclude DiffDriveIK-response.msg.html

(cl:defclass <DiffDriveIK-response> (roslisp-msg-protocol:ros-message)
  ((actions
    :reader actions
    :initarg :actions
    :type (cl:vector wheeled_robot_kinematics-msg:DiffDriveAction)
   :initform (cl:make-array 0 :element-type 'wheeled_robot_kinematics-msg:DiffDriveAction :initial-element (cl:make-instance 'wheeled_robot_kinematics-msg:DiffDriveAction))))
)

(cl:defclass DiffDriveIK-response (<DiffDriveIK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiffDriveIK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiffDriveIK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeled_robot_kinematics-srv:<DiffDriveIK-response> is deprecated: use wheeled_robot_kinematics-srv:DiffDriveIK-response instead.")))

(cl:ensure-generic-function 'actions-val :lambda-list '(m))
(cl:defmethod actions-val ((m <DiffDriveIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-srv:actions-val is deprecated.  Use wheeled_robot_kinematics-srv:actions instead.")
  (actions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiffDriveIK-response>) ostream)
  "Serializes a message object of type '<DiffDriveIK-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'actions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'actions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiffDriveIK-response>) istream)
  "Deserializes a message object of type '<DiffDriveIK-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'actions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'actions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'wheeled_robot_kinematics-msg:DiffDriveAction))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiffDriveIK-response>)))
  "Returns string type for a service object of type '<DiffDriveIK-response>"
  "wheeled_robot_kinematics/DiffDriveIKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveIK-response)))
  "Returns string type for a service object of type 'DiffDriveIK-response"
  "wheeled_robot_kinematics/DiffDriveIKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiffDriveIK-response>)))
  "Returns md5sum for a message object of type '<DiffDriveIK-response>"
  "72b62ffb846e210a0b026254440e0b70")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiffDriveIK-response)))
  "Returns md5sum for a message object of type 'DiffDriveIK-response"
  "72b62ffb846e210a0b026254440e0b70")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiffDriveIK-response>)))
  "Returns full string definition for message of type '<DiffDriveIK-response>"
  (cl:format cl:nil "wheeled_robot_kinematics/DiffDriveAction[] actions~%~%~%~%================================================================================~%MSG: wheeled_robot_kinematics/DiffDriveAction~%float64 left_velocity~%float64 right_velocity~%float64 time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiffDriveIK-response)))
  "Returns full string definition for message of type 'DiffDriveIK-response"
  (cl:format cl:nil "wheeled_robot_kinematics/DiffDriveAction[] actions~%~%~%~%================================================================================~%MSG: wheeled_robot_kinematics/DiffDriveAction~%float64 left_velocity~%float64 right_velocity~%float64 time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiffDriveIK-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'actions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiffDriveIK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DiffDriveIK-response
    (cl:cons ':actions (actions msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DiffDriveIK)))
  'DiffDriveIK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DiffDriveIK)))
  'DiffDriveIK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveIK)))
  "Returns string type for a service object of type '<DiffDriveIK>"
  "wheeled_robot_kinematics/DiffDriveIK")