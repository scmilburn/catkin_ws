# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from wheeled_robot_kinematics/DiffDriveIKRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class DiffDriveIKRequest(genpy.Message):
  _md5sum = "fda12c2e6428fd0d535339c9e49fecf0"
  _type = "wheeled_robot_kinematics/DiffDriveIKRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """geometry_msgs/Pose2D pose
geometry_msgs/Pose2D end_pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
"""
  __slots__ = ['pose','end_pose']
  _slot_types = ['geometry_msgs/Pose2D','geometry_msgs/Pose2D']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       pose,end_pose

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(DiffDriveIKRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.pose is None:
        self.pose = geometry_msgs.msg.Pose2D()
      if self.end_pose is None:
        self.end_pose = geometry_msgs.msg.Pose2D()
    else:
      self.pose = geometry_msgs.msg.Pose2D()
      self.end_pose = geometry_msgs.msg.Pose2D()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_6d.pack(_x.pose.x, _x.pose.y, _x.pose.theta, _x.end_pose.x, _x.end_pose.y, _x.end_pose.theta))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.pose is None:
        self.pose = geometry_msgs.msg.Pose2D()
      if self.end_pose is None:
        self.end_pose = geometry_msgs.msg.Pose2D()
      end = 0
      _x = self
      start = end
      end += 48
      (_x.pose.x, _x.pose.y, _x.pose.theta, _x.end_pose.x, _x.end_pose.y, _x.end_pose.theta,) = _struct_6d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_6d.pack(_x.pose.x, _x.pose.y, _x.pose.theta, _x.end_pose.x, _x.end_pose.y, _x.end_pose.theta))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.pose is None:
        self.pose = geometry_msgs.msg.Pose2D()
      if self.end_pose is None:
        self.end_pose = geometry_msgs.msg.Pose2D()
      end = 0
      _x = self
      start = end
      end += 48
      (_x.pose.x, _x.pose.y, _x.pose.theta, _x.end_pose.x, _x.end_pose.y, _x.end_pose.theta,) = _struct_6d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_6d = struct.Struct("<6d")
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from wheeled_robot_kinematics/DiffDriveIKResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import wheeled_robot_kinematics.msg

class DiffDriveIKResponse(genpy.Message):
  _md5sum = "de08eddbcd5ebd6a498691a3aa905e76"
  _type = "wheeled_robot_kinematics/DiffDriveIKResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """wheeled_robot_kinematics/DiffDriveAction[] actions



================================================================================
MSG: wheeled_robot_kinematics/DiffDriveAction
float64 left_velocity
float64 right_velocity
float64 time


"""
  __slots__ = ['actions']
  _slot_types = ['wheeled_robot_kinematics/DiffDriveAction[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       actions

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(DiffDriveIKResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.actions is None:
        self.actions = []
    else:
      self.actions = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.actions)
      buff.write(_struct_I.pack(length))
      for val1 in self.actions:
        _x = val1
        buff.write(_struct_3d.pack(_x.left_velocity, _x.right_velocity, _x.time))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.actions is None:
        self.actions = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.actions = []
      for i in range(0, length):
        val1 = wheeled_robot_kinematics.msg.DiffDriveAction()
        _x = val1
        start = end
        end += 24
        (_x.left_velocity, _x.right_velocity, _x.time,) = _struct_3d.unpack(str[start:end])
        self.actions.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.actions)
      buff.write(_struct_I.pack(length))
      for val1 in self.actions:
        _x = val1
        buff.write(_struct_3d.pack(_x.left_velocity, _x.right_velocity, _x.time))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.actions is None:
        self.actions = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.actions = []
      for i in range(0, length):
        val1 = wheeled_robot_kinematics.msg.DiffDriveAction()
        _x = val1
        start = end
        end += 24
        (_x.left_velocity, _x.right_velocity, _x.time,) = _struct_3d.unpack(str[start:end])
        self.actions.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3d = struct.Struct("<3d")
class DiffDriveIK(object):
  _type          = 'wheeled_robot_kinematics/DiffDriveIK'
  _md5sum = '72b62ffb846e210a0b026254440e0b70'
  _request_class  = DiffDriveIKRequest
  _response_class = DiffDriveIKResponse
