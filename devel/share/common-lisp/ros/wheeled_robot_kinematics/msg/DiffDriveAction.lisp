; Auto-generated. Do not edit!


(cl:in-package wheeled_robot_kinematics-msg)


;//! \htmlinclude DiffDriveAction.msg.html

(cl:defclass <DiffDriveAction> (roslisp-msg-protocol:ros-message)
  ((left_velocity
    :reader left_velocity
    :initarg :left_velocity
    :type cl:float
    :initform 0.0)
   (right_velocity
    :reader right_velocity
    :initarg :right_velocity
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0))
)

(cl:defclass DiffDriveAction (<DiffDriveAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiffDriveAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiffDriveAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeled_robot_kinematics-msg:<DiffDriveAction> is deprecated: use wheeled_robot_kinematics-msg:DiffDriveAction instead.")))

(cl:ensure-generic-function 'left_velocity-val :lambda-list '(m))
(cl:defmethod left_velocity-val ((m <DiffDriveAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-msg:left_velocity-val is deprecated.  Use wheeled_robot_kinematics-msg:left_velocity instead.")
  (left_velocity m))

(cl:ensure-generic-function 'right_velocity-val :lambda-list '(m))
(cl:defmethod right_velocity-val ((m <DiffDriveAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-msg:right_velocity-val is deprecated.  Use wheeled_robot_kinematics-msg:right_velocity instead.")
  (right_velocity m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <DiffDriveAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeled_robot_kinematics-msg:time-val is deprecated.  Use wheeled_robot_kinematics-msg:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiffDriveAction>) ostream)
  "Serializes a message object of type '<DiffDriveAction>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'left_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'right_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiffDriveAction>) istream)
  "Deserializes a message object of type '<DiffDriveAction>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiffDriveAction>)))
  "Returns string type for a message object of type '<DiffDriveAction>"
  "wheeled_robot_kinematics/DiffDriveAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiffDriveAction)))
  "Returns string type for a message object of type 'DiffDriveAction"
  "wheeled_robot_kinematics/DiffDriveAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiffDriveAction>)))
  "Returns md5sum for a message object of type '<DiffDriveAction>"
  "c9bd451b3971ddfe4940daf396a1d25a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiffDriveAction)))
  "Returns md5sum for a message object of type 'DiffDriveAction"
  "c9bd451b3971ddfe4940daf396a1d25a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiffDriveAction>)))
  "Returns full string definition for message of type '<DiffDriveAction>"
  (cl:format cl:nil "float64 left_velocity~%float64 right_velocity~%float64 time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiffDriveAction)))
  "Returns full string definition for message of type 'DiffDriveAction"
  (cl:format cl:nil "float64 left_velocity~%float64 right_velocity~%float64 time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiffDriveAction>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiffDriveAction>))
  "Converts a ROS message object to a list"
  (cl:list 'DiffDriveAction
    (cl:cons ':left_velocity (left_velocity msg))
    (cl:cons ':right_velocity (right_velocity msg))
    (cl:cons ':time (time msg))
))
