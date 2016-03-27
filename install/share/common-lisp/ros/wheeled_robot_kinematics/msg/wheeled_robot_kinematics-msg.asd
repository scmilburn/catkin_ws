
(cl:in-package :asdf)

(defsystem "wheeled_robot_kinematics-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DiffDriveAction" :depends-on ("_package_DiffDriveAction"))
    (:file "_package_DiffDriveAction" :depends-on ("_package"))
  ))