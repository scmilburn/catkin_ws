
(cl:in-package :asdf)

(defsystem "wheeled_robot_kinematics-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :wheeled_robot_kinematics-msg
)
  :components ((:file "_package")
    (:file "DiffDriveFK" :depends-on ("_package_DiffDriveFK"))
    (:file "_package_DiffDriveFK" :depends-on ("_package"))
    (:file "DiffDriveIK" :depends-on ("_package_DiffDriveIK"))
    (:file "_package_DiffDriveIK" :depends-on ("_package"))
  ))