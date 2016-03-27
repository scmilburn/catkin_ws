# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(FATAL_ERROR "Could not find messages which '/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveFK.srv' depends on. Did you forget to specify generate_messages(DEPENDENCIES ...)?
Cannot locate message [DiffDriveAction]: unknown package [heeled_robot_kinematics] on search path [{'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'wheeled_robot_kinematics': ['/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg']}]")
message(STATUS "wheeled_robot_kinematics: 1 messages, 2 services")

set(MSG_I_FLAGS "-Iwheeled_robot_kinematics:/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wheeled_robot_kinematics_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv" NAME_WE)
add_custom_target(_wheeled_robot_kinematics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheeled_robot_kinematics" "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv" "wheeled_robot_kinematics/DiffDriveAction:geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg" NAME_WE)
add_custom_target(_wheeled_robot_kinematics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheeled_robot_kinematics" "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wheeled_robot_kinematics
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeled_robot_kinematics
)

### Generating Services
_generate_srv_cpp(wheeled_robot_kinematics
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv"
  "${MSG_I_FLAGS}"
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeled_robot_kinematics
)

### Generating Module File
_generate_module_cpp(wheeled_robot_kinematics
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeled_robot_kinematics
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wheeled_robot_kinematics_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wheeled_robot_kinematics_generate_messages wheeled_robot_kinematics_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv" NAME_WE)
add_dependencies(wheeled_robot_kinematics_generate_messages_cpp _wheeled_robot_kinematics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg" NAME_WE)
add_dependencies(wheeled_robot_kinematics_generate_messages_cpp _wheeled_robot_kinematics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeled_robot_kinematics_gencpp)
add_dependencies(wheeled_robot_kinematics_gencpp wheeled_robot_kinematics_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeled_robot_kinematics_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wheeled_robot_kinematics
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeled_robot_kinematics
)

### Generating Services
_generate_srv_lisp(wheeled_robot_kinematics
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv"
  "${MSG_I_FLAGS}"
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeled_robot_kinematics
)

### Generating Module File
_generate_module_lisp(wheeled_robot_kinematics
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeled_robot_kinematics
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wheeled_robot_kinematics_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wheeled_robot_kinematics_generate_messages wheeled_robot_kinematics_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv" NAME_WE)
add_dependencies(wheeled_robot_kinematics_generate_messages_lisp _wheeled_robot_kinematics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg" NAME_WE)
add_dependencies(wheeled_robot_kinematics_generate_messages_lisp _wheeled_robot_kinematics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeled_robot_kinematics_genlisp)
add_dependencies(wheeled_robot_kinematics_genlisp wheeled_robot_kinematics_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeled_robot_kinematics_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wheeled_robot_kinematics
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeled_robot_kinematics
)

### Generating Services
_generate_srv_py(wheeled_robot_kinematics
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv"
  "${MSG_I_FLAGS}"
  "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeled_robot_kinematics
)

### Generating Module File
_generate_module_py(wheeled_robot_kinematics
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeled_robot_kinematics
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wheeled_robot_kinematics_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wheeled_robot_kinematics_generate_messages wheeled_robot_kinematics_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/srv/DiffDriveIK.srv" NAME_WE)
add_dependencies(wheeled_robot_kinematics_generate_messages_py _wheeled_robot_kinematics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/catkin_ws/src/wheeled_robot_kinematics/msg/DiffDriveAction.msg" NAME_WE)
add_dependencies(wheeled_robot_kinematics_generate_messages_py _wheeled_robot_kinematics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeled_robot_kinematics_genpy)
add_dependencies(wheeled_robot_kinematics_genpy wheeled_robot_kinematics_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeled_robot_kinematics_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeled_robot_kinematics)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeled_robot_kinematics
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(wheeled_robot_kinematics_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeled_robot_kinematics)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeled_robot_kinematics
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(wheeled_robot_kinematics_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeled_robot_kinematics)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeled_robot_kinematics\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeled_robot_kinematics
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(wheeled_robot_kinematics_generate_messages_py geometry_msgs_generate_messages_py)
